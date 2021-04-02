# frozen_string_literal: true

namespace :mlb_team do
  task update: :environment do
    mlb_teams = MlbData::Api.team_info

    mlb_teams.each do |team|
      MlbTeam.find_or_create_by(tricode: team['name_abbrev']) do |baseball_team|
        baseball_team.city = team['city']
        baseball_team.full_name = team['name_display_full']
        baseball_team.league_name = team['league']
        baseball_team.div_name = team['division']
      end
      puts "#{team['name_display_full']} is already update!"
    end
  end
end
