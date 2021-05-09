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
end
