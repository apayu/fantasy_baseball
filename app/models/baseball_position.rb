# frozen_string_literal: true
class BaseballPosition < ApplicationRecord
  has_many :cpbl_players, dependent: :restrict_with_error

  def self.pitcher?(position_id)
    position_id.to_i == 1
  end

  def self.hitter?(position_id)
    position_id.to_i != 1
  end
end

# == Schema Information
#
# Table name: baseball_positions
#
#  id         :bigint           not null, primary key
#  code       :string
#  en_name    :string
#  tw_name    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
