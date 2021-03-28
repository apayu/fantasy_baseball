# frozen_string_literal: true

# == Schema Information
#
# Table name: baseball_teams
#
#  id          :bigint           not null, primary key
#  city        :string           default(""), not null
#  div_name    :string           default(""), not null
#  full_name   :string           default(""), not null
#  league_name :string           default(""), not null
#  tricode     :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class BaseballTeam < ApplicationRecord
end
