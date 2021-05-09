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

  include HittingStandardStats

  belongs_to :cpbl_player
  belongs_to :cpbl_schedule

  delegate :match_date, to: :cpbl_schedule
end
