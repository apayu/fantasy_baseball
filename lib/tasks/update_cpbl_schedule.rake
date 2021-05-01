# frozen_string_literal: true

namespace :cpbl_schedule do
  task update: :environment do
    year = '2021'

    (1..12).each do |month|
      p '========'
      p month
      Scraper::Cpbl.new.schedule(year, month.to_s.rjust(2, '0')).each do |match_info|
        next if match_info.nil?

        match_info.each do |match|
          CpblSchedule.find_or_create_by(game_id: match[:game_id]) do |cpbl_schedule|
            cpbl_schedule.home_team_id = CpblTeam.find_by(tricode: match[:home_team]).id
            cpbl_schedule.away_team_id = CpblTeam.find_by(tricode: match[:away_team]).id
            cpbl_schedule.match_date = match[:game_date]
          end
        end
      end
      p 'already update'
    end
  end
end
