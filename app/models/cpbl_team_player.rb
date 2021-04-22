# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_team_players
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cpbl_player_id :bigint
#  cpbl_team_id   :bigint
#
# Indexes
#
#  index_cpbl_team_players_on_cpbl_player_id  (cpbl_player_id)
#  index_cpbl_team_players_on_cpbl_team_id    (cpbl_team_id)
#
class CpblTeamPlayer < ApplicationRecord
  belongs_to :cpbl_player
  belongs_to :cpbl_team
end
