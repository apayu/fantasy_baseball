# frozen_string_literal: true
class CpblPitchingGameLog < ApplicationRecord
  belongs_to :cpbl_player
  belongs_to :cpbl_schedule

  delegate :match_date, to: :cpbl_schedule
end

# == Schema Information
#
# Table name: cpbl_pitching_game_logs
#
#  id               :bigint           not null, primary key
#  bb               :integer
#  bf               :integer
#  bk               :integer
#  er               :integer
#  h                :integer
#  hbp              :integer
#  hld              :integer
#  hr               :integer
#  ip               :integer
#  ipf              :integer
#  l                :integer
#  np               :integer
#  r                :integer
#  s                :integer
#  so               :integer
#  sv               :integer
#  w                :integer
#  wp               :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cpbl_player_id   :bigint
#  cpbl_schedule_id :bigint
#
# Indexes
#
#  index_cpbl_pitching_game_logs_on_cpbl_player_id    (cpbl_player_id)
#  index_cpbl_pitching_game_logs_on_cpbl_schedule_id  (cpbl_schedule_id)
#
