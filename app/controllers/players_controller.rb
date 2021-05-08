# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @cpbl_hitter = CpblPlayerContext.new(:hitter, params).perform
    @cpbl_pitcher = CpblPlayerContext.new(:pitcher, params).perform
  end

  def show
    if @cpbl_player.pitcher?
      @player_game_logs = CpblPitchingGameLog.includes(:cpbl_schedule).where(cpbl_player: @cpbl_player)
    else
      @player_game_logs = CpblHittingGameLog.includes(:cpbl_schedule).where(cpbl_player: @cpbl_player)
    end
  end

  private

  def find_player
    @cpbl_player = CpblPlayer.find(params[:id])
  end
end
