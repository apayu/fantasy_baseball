# frozen_string_literal: true

module Scraper
  class Cpbl
    HOST = 'www.cpbl.com.tw'

    ENDPOINTS = {
      team_players: '/players.html'
    }.freeze

    def teams
      team_list.map do |team_url|
        {
          code: params(team_url['href'])['team'].first,
          full_name: team_url.text
        }
      end
    end

    def players(team_code)
      offset = 0
      player_list = team_players(offset, 1, team_code)
      players_array = []

      while player_list.count != 0

        players_array << players_info(player_list)

        offset += 20
        player_list = team_players(offset, 1, team_code)
      end

      players_array.flatten
    end

    private

    def teams_code_url
      uri_str = URI::HTTP.build(
        host: HOST
      ).to_s

      URI.parse(uri_str)
    end

    def players_info(player_list)
      player_list.map do |player|
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

    def team_players(offset, status, team_code)
      team_players_url = URI::HTTP.build(
        host: HOST,
        path: ENDPOINTS[:team_players],
        query: "offset=#{offset}&status=#{status}&teamno=#{team_code}"
      ).to_s
      uri = URI.parse(team_players_url)
      unparse_page = HTTParty.get(uri)
      Nokogiri::HTML(unparse_page).search('table tr:not(:first-child)')
    end

    def params(url)
      uri = URI.parse(url)
      CGI.parse(uri.query)
    end

    def team_list
      unparse_page = HTTParty.get(teams_code_url)
      Nokogiri::HTML(unparse_page).css('#menu-submenu2').search('li:not(:first-child) a')
    end
  end
end
