# frozen_string_literal: true

module PitchingStandardStats
  extend ActiveSupport::Concern

  def era
    return 0.00 if er.zero?

    begin
      ((er * 9) / real_ip).round(2)
    rescue ZeroDivisionError
      'INF'
    end
  end

  def whip
    return 0.00 if (h + bb).zero?

    begin
      ((h + bb) / real_ip).round(2)
    rescue ZeroDivisionError
      'INF'
    end
  end

  def real_ip
    ((ip * 3 + ipf.to_f) / 3).round(2)
  end
end
