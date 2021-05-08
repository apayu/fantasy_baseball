# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_hitting_game_logs
#
#  id               :bigint           not null, primary key
#  ab               :integer
#  bb               :integer
#  cs               :integer
#  d                :integer
#  e                :integer
#  gidp             :integer
#  h                :integer
#  hbp              :integer
#  hr               :integer
#  r                :integer
#  rbi              :integer
#  sac              :integer
#  sb               :integer
#  sf               :integer
#  so               :integer
#  t                :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cpbl_player_id   :bigint
#  cpbl_schedule_id :bigint
#
# Indexes
#
#  index_cpbl_hitting_game_logs_on_cpbl_player_id    (cpbl_player_id)
#  index_cpbl_hitting_game_logs_on_cpbl_schedule_id  (cpbl_schedule_id)
#
class CpblHittingGameLog < ApplicationRecord
  belongs_to :cpbl_player
  belongs_to :cpbl_schedule

  delegate :match_date, to: :cpbl_schedule

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
