# frozen_string_literal: true

namespace :cpbl_game_log do
  task update: :environment do
    year = '2021'
    matchs = CpblSchedule.all
    matchs.each do |match|
      result = Scraper::Cpbl.new.game_log(match.game_id, match.match_date.tr('/', '-'), year)
      p '===================='
      p "update id:#{match.game_id} date:#{match.match_date}"

      result.each_with_index do |r, i|
        if i <= 1
          r.each do |player|
            p = CpblPlayer.find_by(cpbl_player_id: player[:cpbl_player_id])

            CpblHittingGameLog.find_or_create_by(cpbl_schedule: match, cpbl_player: p) do |game_log|
              game_log.ab = player[:ab]
              game_log.r = player[:r]
              game_log.h = player[:h]
              game_log.rbi = player[:rbi]
              game_log.d = player[:"2b"]
              game_log.t = player[:"3b"]
              game_log.hr = player[:hr]
              game_log.gidp = player[:gidp]
              game_log.bb = player[:bb]
              game_log.hbp = player[:hbp]
              game_log.so = player[:so]
              game_log.sac = player[:sac]
              game_log.sf = player[:sf]
              game_log.sb = player[:sb]
              game_log.cs = player[:cs]
              game_log.e = player[:e]
            end
          end
        else
          r.each do |player|
            p = CpblPlayer.find_by(cpbl_player_id: player[:cpbl_player_id])

            CpblPitchingGameLog.find_or_create_by(cpbl_schedule: match, cpbl_player: p) do |game_log|
              game_log.ip = player[:ip].split('.')[0]
              game_log.ipf = player[:ip].split('.')[1]
              game_log.bf = player[:bf]
              game_log.np = player[:np]
              game_log.s = player[:s]
              game_log.h = player[:h]
              game_log.hr = player[:hr]
              game_log.bb = player[:bb]
              game_log.hbp = player[:hbp]
              game_log.so = player[:so]
              game_log.wp = player[:wp]
              game_log.bk = player[:bk]
              game_log.r = player[:r]
              game_log.er = player[:er]
              game_log.w = player[:w]
              game_log.l = player[:l]
              game_log.hld = player[:hld]
              game_log.sv = player[:sv]
            end
          end
        end
      end

      p 'already update!!'
    end
  end
end
