# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player

  def index
    @cpbl_batter = CpblPlayer.where(primary_stat_type: 'batting')
    @cpbl_pitcher = CpblPlayer.where(primary_stat_type: 'pitching')
  end

  def show; end

  private

  def find_player
    @cpbl_player = CpblPlayer.find(params[:id])
  end
end
