# frozen_string_literal: true

class CreateCpblPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :cpbl_players do |t|
      t.string :cpbl_player_id, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :throws, null: false, default: ''
      t.string :bats, null: false, default: ''
      t.string :status, null: false, default: ''
      t.string :primary_stat_type, null: false, default: ''

      t.timestamps
    end
  end
end
