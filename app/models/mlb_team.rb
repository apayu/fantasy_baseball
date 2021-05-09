# frozen_string_literal: true
class MlbTeam < ApplicationRecord
end

# == Schema Information
#
# Table name: mlb_teams
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
