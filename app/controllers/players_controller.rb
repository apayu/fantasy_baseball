# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @cpbl_hitter = CpblPlayer.where(primary_stat_type: 'batting')
    @cpbl_pitcher = CpblPlayer.where(primary_stat_type: 'pitching')
  end

  def show; end

  private

  def find_player
    @cpbl_player = CpblPlayer.where(id: params[:id])
  end
end
