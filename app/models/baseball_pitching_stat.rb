# frozen_string_literal: true
class BaseballPitchingStat < ApplicationRecord
  belongs_to :player, polymorphic: true

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

# == Schema Information
#
# Table name: baseball_pitching_stats
#
#  id          :bigint           not null, primary key
#  ao          :integer
#  bb          :integer
#  bf          :integer
#  bk          :integer
#  bs          :integer
#  cg          :integer
#  er          :integer
#  g           :integer
#  gidp        :integer
#  gidp_opp    :integer
#  go          :integer
#  gr          :integer
#  gs          :integer
#  h           :integer
#  hbp         :integer
#  hld         :integer
#  hr          :integer
#  ibb         :integer
#  ip          :integer
#  ipf         :integer
#  l           :integer
#  nbb         :integer
#  np          :integer
#  player_type :string
#  qs          :integer
#  r           :integer
#  sho         :integer
#  so          :integer
#  sv          :integer
#  w           :integer
#  wp          :integer
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  player_id   :bigint
#
# Indexes
#
#  index_baseball_pitching_stats_on_player              (player_type,player_id)
#  index_baseball_pitching_stats_on_player_id_and_year  (player_id,year)
#
