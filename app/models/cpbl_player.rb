# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_players
#
#  id                :bigint           not null, primary key
#  bats              :string           default(""), not null
#  name              :string           default(""), not null
#  number            :integer          not null
#  primary_stat_type :string           default(""), not null
#  status            :integer          default("not_active"), not null
#  throws            :string           default(""), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cpbl_player_id    :string           default(""), not null
#
class CpblPlayer < ApplicationRecord
  include Player
  has_many :cpbl_team_players, dependent: :restrict_with_error
  has_many :cpbl_teams, through: :cpbl_team_players

  delegate :g, :avg, :obp, :slg, :ops, :ab, :r, :h, :d, :t, :hr,
           :rbi, :bb, :so, :sb, to: :baseball_hitting_stat, prefix: :batting_stat
  delegate :g, :gs, :w, :l, :sv, :bs, :hld, :cg, :sho, :ip, :h,
           :r, :er, :hr, :bb, :so, :era, :whip, to: :baseball_pitching_stat, prefix: :pitching_stat
end
