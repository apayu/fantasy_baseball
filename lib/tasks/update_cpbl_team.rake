# frozen_string_literal: true

namespace :cpbl_team do
  task update: :environment do
    cpbl_teams = Scraper::Cpbl.new.teams

    cpbl_teams.each do |team|
      CpblTeam.find_or_create_by(tricode: team[:code]) do |cpbl_team|
        cpbl_team.full_name = team[:full_name]
      end

      puts "#{team[:full_name]} is already update!"
    end
  end
end
