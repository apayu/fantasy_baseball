# frozen_string_literal: true

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
#  tpa         :integer
#  xbh         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  player_id   :bigint
#
# Indexes
#
#  index_baseball_hitting_stats_on_player  (player_type,player_id)
#
class BaseballHittingStat < ApplicationRecord
  belongs_to :player, polymorphic: true
end
