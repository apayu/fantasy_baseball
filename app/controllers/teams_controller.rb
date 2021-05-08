# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :find_team, only: :show
  def index
    @cpbl_teams = CpblTeam.where(tricode: CpblTeam::ABBR_NAME.keys.map(&:to_s))
  end

  def show; end

  private

  def find_team
    @cpbl_team = CpblTeam.find(params[:id])
  end
end
