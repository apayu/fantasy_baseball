# frozen_string_literal: true

class CreateCpblSchedule < ActiveRecord::Migration[6.1]
  def change
    create_table :cpbl_schedules do |t|
      t.references :home_team, index: true, foreign_key: { to_table: :cpbl_teams }
      t.references :away_team, index: true, foreign_key: { to_table: :cpbl_teams }
      t.string :location
      t.string :game_id
      t.string :home_score
      t.string :away_score
      t.string :match_date

      t.timestamps
    end
  end
end
