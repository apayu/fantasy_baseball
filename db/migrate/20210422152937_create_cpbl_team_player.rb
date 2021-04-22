# frozen_string_literal: true

class CreateCpblTeamPlayer < ActiveRecord::Migration[6.1]
  def change
    create_table :cpbl_team_players do |t|
      t.references :cpbl_player
      t.references :cpbl_team

      t.timestamps
    end
  end
end
