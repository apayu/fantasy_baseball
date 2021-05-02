# frozen_string_literal: true

class CreateBaseballPosition < ActiveRecord::Migration[6.1]
  def change
    create_table :baseball_positions do |t|
      t.string :code
      t.string :en_name
      t.string :tw_name

      t.timestamps
    end
  end
end
