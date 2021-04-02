# frozen_string_literal: true

require 'json'
require 'net/http'

module MlbData
  class MlbDataApi
    API_HOST = 'lookup-service-prod.mlb.com'

    ENDPOINTS = {
      team_info: '/json/named.team_all_season.bam'
    }.freeze

    def self.team_info
      JSON.parse(Net::HTTP.get(uri))
    end

    def self.uri
      uri_str = URI::HTTPS.build(
        host: API_HOST,
        path: ENDPOINTS[:team_info],
        query: "sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='#{Time.zone.now.year}'"
      ).to_s

      URI.parse(uri_str)
    end
  end
end
