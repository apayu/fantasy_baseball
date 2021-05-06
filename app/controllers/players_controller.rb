# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :find_player, only: [:show]

  def index
    @cpbl_hitter = CpblPlayerContext.new(params[:order_by], params[:desc], 'y').perform
    @cpbl_pitcher = CpblPlayerContext.new(params[:order_by], params[:desc], 'n').perform
  end

  def show; end

  private

  def find_player
    @cpbl_player = CpblPlayer.where(id: params[:id])
  end
end
