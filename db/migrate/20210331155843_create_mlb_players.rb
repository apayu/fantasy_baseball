# frozen_string_literal: true

class CreateMlbPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :mlb_players do |t|
      t.string :mlb_data_player_id, null: false, default: ''
      t.string :name_display_first_last, null: false, default: ''
      t.string :throws, null: false, default: ''
      t.string :bats, null: false, default: ''
      t.string :status, null: false, default: ''
      t.string :primary_stat_type, null: false, default: ''

      t.timestamps
    end
  end
end
