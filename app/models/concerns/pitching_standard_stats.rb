# frozen_string_literal: true

module PitchingStandardStats
  extend ActiveSupport::Concern

  def era
    ((er * 9) / real_ip).round(2)
  end

  def whip
    ((h + bb) / real_ip).round(2)
  end

  def baa
    (h / ab).round(2)
  end

  def real_ip
    ip.to_i + ((ip % 1).round(1) * 10) / 3
  end
end
