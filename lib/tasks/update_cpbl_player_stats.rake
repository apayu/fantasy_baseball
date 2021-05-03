# frozen_string_literal: true

namespace :cpbl_player_stats do
  task update: :environment do
    year = '2021'
    cpbl_players = CpblPlayer.all

    cpbl_players.each do |player|
      team_code = player.cpbl_teams[0].tricode
      scraper = Scraper::Cpbl.new
      player_hitting_stats = scraper.hitting_stats(year, player.cpbl_player_id, team_code)&.reduce({}, :merge)
      player_pitching_stats = scraper.pitching_stats(year, player.cpbl_player_id, team_code)&.reduce({}, :merge)

      puts '============================================'
      puts "#{player.name}: "

      unless player_pitching_stats.nil?
        BaseballPitchingStat.find_or_create_by(year: year, player: player) do |p|
          p.g = player_pitching_stats[:g]
          p.ip = player_pitching_stats[:ip]
          p.gs = player_pitching_stats[:gs]
          p.gr = player_pitching_stats[:gr]
          p.cg = player_pitching_stats[:cg]
          p.sho = player_pitching_stats[:sho]
          p.nbb = player_pitching_stats[:nbb]
          p.bf =  player_pitching_stats[:bf]
          p.np = player_pitching_stats[:np]
          p.w = player_pitching_stats[:w]
          p.l = player_pitching_stats[:l]
          p.sv = player_pitching_stats[:sv]
          p.bs = player_pitching_stats[:bs]
          p.hld = player_pitching_stats[:hld]
          p.h = player_pitching_stats[:h]
          p.hr = player_pitching_stats[:hr]
          p.bb = player_pitching_stats[:bb]
          p.ibb = player_pitching_stats[:ibb]
          p.hbp = player_pitching_stats[:hbp]
          p.so = player_pitching_stats[:so]
          p.wp = player_pitching_stats[:wp]
          p.bk = player_pitching_stats[:bk]
          p.r = player_pitching_stats[:r]
          p.er = player_pitching_stats[:er]
          p.go = player_pitching_stats[:go]
          p.ao = player_pitching_stats[:ao]
        end
        puts "#{player[:name]} is already update hitting stats!"
      end

      next if player_hitting_stats.nil?

      BaseballHittingStat.find_or_create_by(year: year, player: player) do |p|
        p.g = player_hitting_stats[:g]
        p.ab = player_hitting_stats[:ab]
        p.pa = player_hitting_stats[:pa]
        p.r = player_hitting_stats[:r]
        p.h = player_hitting_stats[:h]
        p.d = player_hitting_stats[:"2b"]
        p.t = player_hitting_stats[:"3b"]
        p.hr = player_hitting_stats[:hr]
        p.rbi = player_hitting_stats[:rbi]
        p.sb = player_hitting_stats[:sb]
        p.tb = player_hitting_stats[:tb]
        p.so = player_hitting_stats[:so]
        p.bb = player_hitting_stats[:bb]
        p.ibb = player_hitting_stats[:ibb]
        p.hbp = player_hitting_stats[:hbp]
        p.ao = player_hitting_stats[:ao]
        p.go = player_hitting_stats[:go]
        p.gidp = player_hitting_stats[:gidp]
        p.sf = player_hitting_stats[:sf]
        p.sac = player_hitting_stats[:sac]
        p.cs = player_hitting_stats[:cs]
      end

      puts "#{player[:name]} is already update pitching stats!"
    end
  end
end
