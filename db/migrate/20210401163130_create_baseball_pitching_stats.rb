# frozen_string_literal: true

class CreateBaseballPitchingStats < ActiveRecord::Migration[6.1]
  def change
    create_table :baseball_pitching_stats do |t|
      t.integer :g
      t.integer :gs
      t.float :ip

      t.integer :r
      t.integer :er
      t.integer :hr
      t.integer :bb
      t.integer :so
      t.integer :w
      t.integer :l
      t.integer :sv
      t.integer :hld
      t.integer :qs
      t.integer :gidp # Ground into Double play
      t.integer :gidp_opp # Ground into Double play opportunity
      t.integer :hb
      t.integer :ibb

      t.references :mlb_players, foreign_key: true

      t.timestamps
    end
  end
end
