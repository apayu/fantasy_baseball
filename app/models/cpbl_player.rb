# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_players
#
#  id                  :bigint           not null, primary key
#  bats                :string           default(""), not null
#  name                :string           default(""), not null
#  number              :integer          not null
#  primary_stat_type   :string           default(""), not null
#  status              :integer          default("not_active"), not null
#  throws              :string           default(""), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cpbl_player_id      :string           default(""), not null
#  primary_position_id :bigint
#
# Indexes
#
#  index_cpbl_players_on_primary_position_id  (primary_position_id)
#
# Foreign Keys
#
#  fk_rails_...  (primary_position_id => baseball_positions.id)
#
class CpblPlayer < ApplicationRecord
  include Player
  has_many :cpbl_team_players, dependent: :restrict_with_error
  has_many :cpbl_teams, through: :cpbl_team_players
  has_many :cpbl_hitting_game_logs, dependent: :restrict_with_error
  has_many :cpbl_pitching_game_logs, dependent: :restrict_with_error
  belongs_to :primary_position, class_name: 'BaseballPosition'

  delegate :g, :avg, :obp, :slg, :ops, :ab, :r, :h, :d, :t, :hr,
           :rbi, :bb, :so, :sb, to: :baseball_hitting_stat, prefix: :batting_stat, allow_nil: true

  delegate :g, :gs, :w, :l, :sv, :bs, :hld, :cg, :sho, :ip, :h,
           :r, :er, :hr, :bb, :so, :era, :whip, to: :baseball_pitching_stat, prefix: :pitching_stat, allow_nil: true

  def pitcher?
    primary_stat_type == 'pitching'
  end

  def pitcher_stats_is_empty?
    baseball_pitching_stat.nil?
  end

  def batter_stats_is_empty?
    baseball_hitting_stat.nil?
  end
end
