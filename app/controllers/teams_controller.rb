# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @teams = CpblTeam.all
  end
end
