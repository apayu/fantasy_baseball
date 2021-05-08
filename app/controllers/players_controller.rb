# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @cpbl_hitter = CpblPlayerContext.new(:hitter, params).perform
    @cpbl_pitcher = CpblPlayerContext.new(:pitcher, params).perform
  end

  def show
    @cpbl_player = CpblPlayer.includes(cpbl_hitting_game_logs: [:cpbl_schedule]).find(params[:id])
  end
end
