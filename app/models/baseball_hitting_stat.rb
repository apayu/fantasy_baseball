# frozen_string_literal: true
class BaseballHittingStat < ApplicationRecord
  belongs_to :player, polymorphic: true

  def avg
    (h.to_f / ab).round(3)
  end

  def obp
    (h + to_base).fdiv(ab + to_base + sf).round(3)
  end

  def slg
    (tb.to_f / ab).round(3)
  end

  def ops
    (obp + slg).round(3)
  end

  def to_base
    bb + hbp
  end
end

# == Schema Information
#
# Table name: baseball_hitting_stats
#
#  id          :bigint           not null, primary key
#  ab          :integer
#  ao          :integer
#  bb          :integer
#  cs          :integer
#  d           :integer
#  g           :integer
#  gidp        :integer
#  gidp_opp    :integer
#  go          :integer
#  h           :integer
#  hbp         :integer
#  hr          :integer
#  ibb         :integer
#  lob         :integer
#  pa          :integer
#  player_type :string
#  r           :integer
#  rbi         :integer
#  roe         :integer
#  sac         :integer
#  sb          :integer
#  sf          :integer
#  so          :integer
#  t           :integer
#  tb          :integer
#  xbh         :integer
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  player_id   :bigint
#
# Indexes
#
#  index_baseball_hitting_stats_on_player              (player_type,player_id)
#  index_baseball_hitting_stats_on_player_id_and_year  (player_id,year)
#
