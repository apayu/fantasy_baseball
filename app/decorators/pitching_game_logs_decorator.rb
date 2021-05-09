# frozen_string_literal: true

class PitchingGameLogsDecorator
  def initialize(game_logs)
    @game_logs = game_logs
  end

  def w
    @game_logs.sum(&:w)
  end

  def l
    @game_logs.sum(&:l)
  end

  def sv
    @game_logs.sum(&:sv)
  end

  def hld
    @game_logs.sum(&:hld)
  end

  def ip
    @game_logs.sum(&:ip)
  end

  def ipf
    @game_logs.sum(&:ipf)
  end

  def h
    @game_logs.sum(&:h)
  end

  def r
    @game_logs.sum(&:r)
  end

  def er
    @game_logs.sum(&:er)
  end

  def bb
    @game_logs.sum(&:bb)
  end

  def so
    @game_logs.sum(&:so)
  end

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

  def baa
    (h / ab).round(2)
  end

  def real_ip
    ((ip * 3 + ipf.to_f) / 3).round(2)
  end
end

