# frozen_string_literal: true

class CreateCpblPitchingGameLog < ActiveRecord::Migration[6.1]
  def change
    create_table :cpbl_pitching_game_logs do |t|
      t.references :cpbl_player
      t.references :cpbl_schedule

      t.float :ip
      t.integer :w
      t.integer :l
      t.integer :sv
      t.integer :hld
      t.integer :bf # Batter Faced
      t.integer :np # Number of Pitches
      t.integer :s # Strike
      t.integer :h
      t.integer :hr
      t.integer :bb
      t.integer :hbp
      t.integer :so
      t.integer :wp # Wild Pitch
      t.integer :bk # Balk
      t.integer :r
      t.integer :er

      t.timestamps
    end
  end
end
