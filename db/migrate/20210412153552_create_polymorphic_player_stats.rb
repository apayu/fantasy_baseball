# frozen_string_literal: true

class CreatePolymorphicPlayerStats < ActiveRecord::Migration[6.1]
  def change
    remove_reference :baseball_hitting_stats, :mlb_players, foreign_key: true
    add_reference :baseball_hitting_stats, :player, polymorphic: true, inde: true
  end
end
