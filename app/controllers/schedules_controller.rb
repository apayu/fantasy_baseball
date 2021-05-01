# frozen_string_literal: true

class SchedulesController < ApplicationController
  def index
    @cpbl_schedule = CpblSchedule.all
  end
end
