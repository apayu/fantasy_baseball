# frozen_string_literal: true

class CreateBaseballTeam < ActiveRecord::Migration[6.1]
  def change
    create_table :baseball_teams do |t|
      t.string :city, null: false, default: ''
      t.string :full_name, null: false, default: ''
      t.string :tricode, null: false, default: ''
      t.string :league_name, null: false, default: ''
      t.string :div_name, null: false, default: ''

      t.timestamps
    end
  end
end
