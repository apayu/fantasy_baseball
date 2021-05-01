# frozen_string_literal: true

module Scraper
  class Cpbl
    HOST = 'www.cpbl.com.tw'

    ENDPOINTS = {
      teams: '/',
      team_roster: '/players.html',
      player_stats: '/players/person.html',
      schedule: '/schedule/index'
    }.freeze

    def teams
      team_list.map do |team|
        {
          code: params(team['href'])['team'].first,
          full_name: team.text
        }
      end
    end

    def team_roster(team_code)
      offset = 0
      players = player_list(offset, 1, team_code)
      players_array = []

      while players.count != 0

        players_array << players_info(players)

        offset += 20
        players = player_list(offset, 1, team_code)
      end

      players_array.flatten
    end

    # TODO: refactor
    # rubocop:disable Metrics/AbcSize
    def stats(year, player_id, team_code)
      query = "player_id=#{player_id}&teamno=#{team_code}"
      each_year_stats = parsed_html(ENDPOINTS[:player_stats], query).at("th:contains('YEAR')").parent.parent
      stats_item = each_year_stats.search('th')

      player_stats_of_year = each_year_stats.at("td:contains('#{year}')")

      return nil if player_stats_of_year.nil?

      player_stats = player_stats_of_year.parent.search('td')

      stats_item.map.with_index do |stat, index|
        { stat.text.downcase.to_sym => player_stats[index].text.strip }
      end
    end

    # rubocop:disable Metrics/MethodLength
    # TODO: refactor
    def schedule(year, month)
      query = "date=#{year}-#{month}-01&gameno=01&sfieldsub=&sgameno=01"
      schedule_by_month = parsed_html("#{ENDPOINTS[:schedule]}/#{year}-#{month}-01.html", query)
      a = schedule_by_month.search('th.past')
      b = schedule_by_month.search('td[valign="top"]')

      b.each_with_index.map do |val, index|
        next if val.search('div.one_block').empty?

        val.search('div.one_block').map do |match|
          {
            home_team: match.search('table.schedule_team img')[1].attr('src').split('/')[-1].split('_')[0],
            away_team: match.search('table.schedule_team img')[0].attr('src').split('/')[-1].split('_')[0],
            locaiton: match.search('table.schedule_team td')[1].text,
            game_id: match.search('table.schedule_info')[0].search('th')[1].text,
            game_date: "#{year}/#{month}/#{a[index].text}"
          }
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

    private

    def players_info(players)
      players.map do |player|
        {
          player_id: params(player.search('a')[1]['href'])['player_id'].first,
          name: player.search('a')[1].text,
          status: player_status(player),
          primary_stat_type: player_primary_stat_type(player)
        }
      end
    end

    def player_status(player)
      player.search('td')[2].text == '現役' ? '1' : '0'
    end

    def player_primary_stat_type(player)
      player.search('td').last.text == '投手' ? 'pitching' : 'batting'
    end

    def player_list(offset, status, team_code)
      query = "offset=#{offset}&status=#{status}&teamno=#{team_code}"
      parsed_html(ENDPOINTS[:team_roster], query).search('table tr:not(:first-child)')
    end

    def team_list
      parsed_html(ENDPOINTS[:teams], '').css('#menu-submenu2').search('li:not(:first-child) a')
    end

    def params(url)
      uri = URI.parse(url)
      CGI.parse(uri.query)
    end

    def parsed_html(endpoint, query)
      uri = URI::HTTP.build(
        host: HOST,
        path: endpoint,
        query: query
      ).to_s

      response = HTTParty.get(URI.parse(uri))
      Nokogiri::HTML(response.body)
    end
  end
end
