# frozen_string_literal: true

class HittingGameLogsDecorator

  def initialize(game_logs)
    @game_logs = game_logs
  end

  def ab
    @game_logs.sum(&:ab)
  end

  def r
    @game_logs.sum(&:r)
  end

  def h
    @game_logs.sum(&:h)
  end

  def d
    @game_logs.sum(&:d)
  end

  def t
    @game_logs.sum(&:t)
  end

  def hr
    @game_logs.sum(&:hr)
  end

  def rbi
    @game_logs.sum(&:rbi)
  end

  def bb
    @game_logs.sum(&:bb)
  end

  def so
    @game_logs.sum(&:so)
  end

  def sb
    @game_logs.sum(&:sb)
  end

  def cs
    @game_logs.sum(&:cs)
  end

  def hbp
   0
  end

  def sf
    @game_logs.sum(&:sf)
  end

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
