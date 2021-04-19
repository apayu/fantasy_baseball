# frozen_string_literal: true

class CreateBaseballPitchingStats < ActiveRecord::Migration[6.1]
  def change
    create_table :baseball_pitching_stats do |t|
      t.integer :year, null: false
      t.integer :g
      t.float :ip
      t.integer :gs
      t.integer :gr # game rescue
      t.integer :cg # complete game
      t.integer :sho # shutout
      t.integer :nbb # no bb
      t.integer :bf # batter faced
      t.integer :np #
      t.integer :h

      t.integer :r
      t.integer :er
      t.integer :hr
      t.integer :bb
      t.integer :ibb
      t.integer :so
      t.integer :hbp
      t.integer :w
      t.integer :l
      t.integer :sv
      t.integer :bs
      t.integer :hld
      t.integer :qs
      t.integer :gidp # Ground into Double play
      t.integer :gidp_opp # Ground into Double play opportunity
      t.integer :wp # wild pitch
      t.integer :bk # balk
      t.integer :go # ground out
      t.integer :ao # air out

      t.references :player, polymorphic: true
      t.index %i[player_id year]

      t.timestamps
    end
  end
end
