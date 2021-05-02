# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @cpbl_hitter = CpblPlayer.joins(%i[cpbl_hitting_game_logs cpbl_teams primary_position]).where(primary_stat_type: 'batting').group('cpbl_players.id, cpbl_teams.tricode, baseball_positions.code').select(
      <<-SQL.squish
                     cpbl_players.*,
                     cpbl_teams.tricode,
                     baseball_positions.code,
                     count(*) AS g,
                     SUM(cpbl_hitting_game_logs.ab) AS ab,
                     SUM(cpbl_hitting_game_logs.r) AS r,
                     SUM(cpbl_hitting_game_logs.h) AS h,
                     SUM(cpbl_hitting_game_logs.d) AS d,
                     SUM(cpbl_hitting_game_logs.t) AS t,
                     SUM(cpbl_hitting_game_logs.hr) AS hr,
                     SUM(cpbl_hitting_game_logs.rbi) AS rbi,
                     SUM(cpbl_hitting_game_logs.bb) AS bb,
                     SUM(cpbl_hitting_game_logs.so) AS so,
                     SUM(cpbl_hitting_game_logs.hbp) AS hbp,
                     SUM(cpbl_hitting_game_logs.sf) AS sf,
                     SUM(cpbl_hitting_game_logs.sb) AS sb
      SQL
    )
    # @cpbl_hitter = CpblPlayer.includes(%i[cpbl_hitting_game_logs cpbl_teams]).where(primary_stat_type: 'batting')
    # @cpbl_pitcher = CpblPlayer.includes(%i[baseball_pitching_stat cpbl_teams]).where(primary_stat_type: 'pitching')
  end

  def show; end

  private

  def find_player
    @cpbl_player = CpblPlayer.where(id: params[:id])
  end
end
