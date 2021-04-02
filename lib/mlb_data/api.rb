# frozen_string_literal: true

require 'json'
require 'net/http'

module MlbData
  class Api
    API_HOST = 'lookup-service-prod.mlb.com'

    ENDPOINTS = {
      team_info: '/json/named.team_all_season.bam',
      roster_info: '/json/named.roster_40.bam'
    }.freeze

    def self.team_info
      query = "sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='#{Time.zone.now.year}'"

      fetch(ENDPOINTS[:team_info], query)['team_all_season']['queryResults']['row']
    end

    def self.roster_info(team_id)
      query = "team_id='#{team_id}'"

      fetch(ENDPOINTS[:roster_info], query)['roster_40']['queryResults']['row']
    end

    def self.fetch(endpoint, query)
      uri_str = URI::HTTPS.build(
        host: API_HOST,
        path: endpoint,
        query: query
      ).to_s

      JSON.parse(Net::HTTP.get(URI.parse(uri_str)))
    end
  end
end
