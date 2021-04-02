# frozen_string_literal: true

namespace :mlb_team_roster do
  task update: :environment do
    mlb_teams = MlbData::Api.team_info

    mlb_teams.each do |team|
      roster = MlbData::Api.roster_info(team['team_id'])
      puts '============================================'
      puts "#{team['name_display_full']}: "

      roster.each do |player|
        MlbPlayer.find_or_create_by(mlb_data_player_id: player['player_id']) do |mlb_player|
          mlb_player.name_display_first_last = player['name_display_first_last']
          mlb_player.throws = player['throws']
          mlb_player.bats = player['bats']
          mlb_player.status = player['status_code']
          mlb_player.primary_stat_type = player['primary_position']
        end

        puts "#{player['name_display_first_last']} is already update!"
      end
    end
  end
end
