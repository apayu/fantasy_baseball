# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_teams
#
#  id         :bigint           not null, primary key
#  city       :string           default(""), not null
#  full_name  :string           default(""), not null
#  tricode    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CpblTeam < ApplicationRecord
  has_many :cpbl_team_players, dependent: :restrict_with_error
  has_many :cpbl_players, through: :cpbl_team_players
end
