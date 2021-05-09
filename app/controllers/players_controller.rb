# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @cpbl_player = CpblPlayerContext.new(params).perform
  end

  def show
    if @cpbl_player.pitcher?
      @player_game_logs = CpblPitchingGameLog.includes(:cpbl_schedule).where(cpbl_player: @cpbl_player)
      @player_session_game_logs = PitchingGameLogsDecorator.new(@player_game_logs)
      @player_last_7_game_logs = PitchingGameLogsDecorator.new(@player_game_logs.last(7))
      @player_last_14_game_logs = PitchingGameLogsDecorator.new(@player_game_logs.last(14))
    else
      @player_game_logs = CpblHittingGameLog.includes(:cpbl_schedule).where(cpbl_player: @cpbl_player)
      @player_session_game_logs = HittingGameLogsDecorator.new(@player_game_logs)
      @player_last_7_game_logs = HittingGameLogsDecorator.new(@player_game_logs.last(7))
      @player_last_14_game_logs = HittingGameLogsDecorator.new(@player_game_logs.last(14))
    end
  end

  private

  def find_player
    @cpbl_player = CpblPlayer.find(params[:id])
  end
end
