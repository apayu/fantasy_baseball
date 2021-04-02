# frozen_string_literal: true

class CreateBaseballHittingStats < ActiveRecord::Migration[6.1]
  def change
    create_table :baseball_hitting_stats do |t|
      t.integer :g
      t.integer :ab

      t.integer :r
      t.integer :h
      t.integer :d # Double
      t.integer :t
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :tb # Total Bases
      t.integer :so
      t.integer :bb

      t.integer :lob # Left on Base
      t.integer :xbh # Extra base hit
      t.integer :ao # Air Outs
      t.integer :go # Ground Outs
      t.integer :gidp # Ground into Double play
      t.integer :gidp_opp # Ground into Double play opportunity
      t.integer :sf # Sacrifice flies
      t.integer :sac # sacrifice bunt
      t.integer :cs # Caught Stealing
      t.integer :hbp # Caught Stealing
      t.integer :ibb # Intentional Walks
      t.integer :roe # Reached on error
      t.integer :tpa

      t.references :mlb_players, foreign_key: true

      t.timestamps
    end
  end
end
