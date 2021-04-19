# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @cpbl_batter = CpblPlayer.where(primary_stat_type: 'batting')
    @cpbl_pitcher = CpblPlayer.where(primary_stat_type: 'pitching')
  end
end
