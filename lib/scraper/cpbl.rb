# frozen_string_literal: true

module Scraper
  # rubocop:disable all
  # TODO: refactor
  class Cpbl
    attr_accessor :player_stats_page

    HOST = 'www.cpbl.com.tw'

    ENDPOINTS = {
      teams: '/players.html',
      team_roster: '/players.html',
      player_stats: '/players/person.html',
      schedule: '/schedule/index',
      game_log: '/games/box.html'
    }.freeze

    def teams
      team_list.map do |team|
        {
          code: team.attr('value'),
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

    def hitting_stats(year, player_id, team_code)
      result = get_player_stats_page(year, player_id, team_code).at("th:contains('AVG')")

      return nil if result.nil?

      each_year_stats = result .parent.parent

      stats_item = each_year_stats.search('th')

      player_stats_of_year = each_year_stats.at("td:contains('#{year}')")

      return nil if player_stats_of_year.nil?

      player_stats = player_stats_of_year.parent.search('td')

      stats_item.map.with_index do |stat, index|
        { stat.text.downcase.to_sym => player_stats[index].text.strip }
      end
    end

    def pitching_stats(year, player_id, team_code)
      result = get_player_stats_page(year, player_id, team_code).at("th:contains('ERA')")

      return nil if result.nil?

      each_year_stats = result .parent.parent

      stats_item = each_year_stats.search('th')

      player_stats_of_year = each_year_stats.at("td:contains('#{year}')")

      return nil if player_stats_of_year.nil?

      player_stats = player_stats_of_year.parent.search('td')

      stats_item.map.with_index do |stat, index|
        { stat.text.downcase.to_sym => player_stats[index].text.strip }
      end
    end

    def schedule(year, month)
      query = "date=#{year}-#{month}-01&gameno=01&sfieldsub=&sgameno=01"
      schedule_by_month = parsed_html("#{ENDPOINTS[:schedule]}/#{year}-#{month}-01.html", query)
      day = schedule_by_month.search('th.past, th.today, th.future')
      match_by_day = schedule_by_month.search('td[valign="top"]')

      match_by_day.each_with_index.map do |val, index|
        next if val.search('div.one_block').empty?

        val.search('div.one_block').map do |match|
          {
            home_team: match.search('table.schedule_team img')[1].attr('src').split('/')[-1].split('_')[0],
            away_team: match.search('table.schedule_team img')[0].attr('src').split('/')[-1].split('_')[0],
            locaiton: match.search('table.schedule_team td')[1].text,
            game_id: match.search('table.schedule_info')[0].search('th')[1].text,
            game_date: "#{year}/#{month}/#{day[index].text}"
          }
        end
      end
    end

    def game_log(game_id, match_date, year)
      query = "game_type=01&game_id=#{game_id}&game_date=#{match_date}&date=#{match_date}&pbyear=#{year}"
      game_log = parsed_html(ENDPOINTS[:game_log], query)
      players_stats = []
      th_stat_items = game_log.search('div#box_pop_guest').search('th')
      tr_guest = game_log.search('div#box_pop_guest').search('tr:not(:first-child):not(:last-child)')
      tr_host = game_log.search('div#box_pop_host').search('tr:not(:first-child):not(:last-child)')
      th_p_stat_items = game_log.search('div#box_pop_pitcher_guest').search('th')
      tr_p_guest = game_log.search('div#box_pop_pitcher_guest').search('tr:not(:first-child):not(:last-child)')
      tr_p_host = game_log.search('div#box_pop_pitcher_host').search('tr:not(:first-child):not(:last-child)')

      a = tr_guest.map do |player|
        stats = player.search('td')
        th_stat_items.each_with_index.map do |item, index|
          if index == 0
            cpbl_player_id = params(stats[index].search('a').attr('href').value)["player_id"].first
            { cpbl_player_id: cpbl_player_id }
          else
            { item.text.downcase.to_sym => stats[index].text }
          end
        end.reduce({}, :merge)
      end

      b = tr_host.map do |player|
        stats = player.search('td')
        th_stat_items.each_with_index.map do |item, index|
          if index == 0
            cpbl_player_id = params(stats[index].search('a').attr('href').value)["player_id"].first
            { cpbl_player_id: cpbl_player_id }
          else
            { item.text.downcase.to_sym => stats[index].text }
          end
        end.reduce({}, :merge)
      end

      c = tr_p_guest.map do |player|
        stats = player.search('td')
        th_p_stat_items.each_with_index.map do |item, index|
          if index == 0
            cpbl_player_id = params(stats[index].search('a').attr('href').value)["player_id"].first
            { cpbl_player_id: cpbl_player_id }
          else
            { item.text.downcase.to_sym => stats[index].text }
          end
        end.reduce({}, :merge)
      end

      d = tr_p_host.map do |player|
        stats = player.search('td')
        th_p_stat_items.each_with_index.map do |item, index|
          if index == 0
            cpbl_player_id = params(stats[index].search('a').attr('href').value)["player_id"].first
            { cpbl_player_id: cpbl_player_id }
          else
            { item.text.downcase.to_sym => stats[index].text }
          end
        end.reduce({}, :merge)
      end

      [a, b, c, d]
    end

    private

    def get_player_stats_page(year, player_id, team_code)
      query = "player_id=#{player_id}&teamno=#{team_code}"
      @player_stats_page ||= parsed_html(ENDPOINTS[:player_stats], query)
    end

    def players_info(players)
      players.map do |player|
        {
          player_id: params(player.search('a')[1]['href'])['player_id'].first,
          primary_position: player.search('td').last.text,
          name: player.search('a')[1].text.gsub(/[^\p{Han}]/, ''),
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
      parsed_html(ENDPOINTS[:teams], '').css('select.select_longer').search('option:not(:first-child)')
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
  # rubocop:enable all
end
