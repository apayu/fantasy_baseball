# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_schedules
#
#  id           :bigint           not null, primary key
#  away_score   :string
#  home_score   :string
#  location     :string
#  match_date   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  away_team_id :bigint
#  game_id      :string
#  home_team_id :bigint
#
# Indexes
#
#  index_cpbl_schedules_on_away_team_id  (away_team_id)
#  index_cpbl_schedules_on_home_team_id  (home_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (away_team_id => cpbl_teams.id)
#  fk_rails_...  (home_team_id => cpbl_teams.id)
#
class CpblSchedule < ApplicationRecord
  belongs_to :home_team, class_name: 'CpblTeam'
  belongs_to :away_team, class_name: 'CpblTeam'
  has_many :cpbl_hitting_game_logs, dependent: :restrict_with_error
  has_many :cpbl_pitching_game_logs, dependent: :restrict_with_error
end
