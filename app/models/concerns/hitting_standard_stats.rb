# frozen_string_literal: true

module HittingStandardStats
  extend ActiveSupport::Concern

  def avg
    result = (h.to_f / ab).round(3)

    result.nan? ? 0.0 : result
  end

  def obp
    result = (h + to_base).fdiv(ab + to_base + sf).round(3)

    result.nan? ? 0.0 : result
  end

  def slg
    result = (tb.to_f / ab).round(3)

    result.nan? ? 0.0 : result
  end

  def ops
    (obp + slg).round(3) || 0
  end

  def tb
    (h - d - t - hr) + (d * 2) + (t * 3) + (hr * 4)
  end

  def to_base
    bb + hbp
  end
end
