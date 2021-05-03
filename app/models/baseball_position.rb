# frozen_string_literal: true

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
class BaseballPosition < ApplicationRecord
  has_many :cpbl_players, dependent: :restrict_with_error
end
