# frozen_string_literal: true

namespace :cpbl_team_roster do
  task update: :environment do
    cpbl_teams = CpblTeam.all

    cpbl_teams.each do |team|
      roster = Scraper::Cpbl.new.team_roster(team.tricode)

      puts '============================================'
      puts "#{team.full_name}: "

      roster.each do |player|
        cpbl_player = CpblPlayer.find_or_create_by(cpbl_player_id: player[:player_id]) do |p|
          p.name = player[:name]
          p.primary_position = BaseballPosition.find_by(tw_name: player[:primary_position])
          p.number = 0
          p.primary_stat_type = player[:primary_stat_type]
          p.status = player[:status].to_i
        end

        CpblTeamPlayer.find_or_create_by(cpbl_team: team, cpbl_player: cpbl_player)

        puts "#{player[:name]} is already update!"
      end
    end
  end
end
