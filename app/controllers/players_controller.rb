# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @cpbl_player = CpblPlayer.all
  end
end
