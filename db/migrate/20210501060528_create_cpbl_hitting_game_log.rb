# frozen_string_literal: true

class CreateCpblHittingGameLog < ActiveRecord::Migration[6.1]
  def change
    create_table :cpbl_hitting_game_logs do |t|
      t.references :cpbl_player
      t.references :cpbl_schedule

      t.integer :ab
      t.integer :r
      t.integer :h
      t.integer :rbi
      t.integer :d
      t.integer :t
      t.integer :hr
      t.integer :gidp
      t.integer :bb
      t.integer :hbp
      t.integer :so
      t.integer :sac
      t.integer :sf
      t.integer :sb
      t.integer :cs
      t.integer :e

      t.timestamps
    end
  end
end
