# frozen_string_literal: true

namespace :cpbl_player_stats do
  task update: :environment do
    year = '2021'
    cpbl_players = CpblPlayer.all

    cpbl_players.each do |player|
      team_code = player.cpbl_teams[0].tricode
      player_stats = Scraper::Cpbl.new.stats(year, player.cpbl_player_id, team_code)&.reduce({}, :merge)

      puts '============================================'
      puts "#{player.name}: "

      if player.pitcher? && !player_stats.nil?
        BaseballPitchingStat.find_or_create_by(year: year, player: player) do |p|
          p.g = player_stats[:g]
          p.ip = player_stats[:ip]
          p.gs = player_stats[:gs]
          p.gr = player_stats[:gr]
          p.cg = player_stats[:cg]
          p.sho = player_stats[:sho]
          p.nbb = player_stats[:nbb]
          p.bf =  player_stats[:bf]
          p.np = player_stats[:np]
          p.w = player_stats[:w]
          p.l = player_stats[:l]
          p.sv = player_stats[:sv]
          p.bs = player_stats[:bs]
          p.hld = player_stats[:hld]
          p.h = player_stats[:h]
          p.hr = player_stats[:hr]
          p.bb = player_stats[:bb]
          p.ibb = player_stats[:ibb]
          p.hbp = player_stats[:hbp]
          p.so = player_stats[:so]
          p.wp = player_stats[:wp]
          p.bk = player_stats[:bk]
          p.r = player_stats[:r]
          p.er = player_stats[:er]
          p.go = player_stats[:go]
          p.ao = player_stats[:ao]
        end
      end

      puts "#{player[:name]} is already update!"
    end
  end
end
