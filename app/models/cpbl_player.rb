# frozen_string_literal: true

# == Schema Information
#
# Table name: cpbl_players
#
#  id                :bigint           not null, primary key
#  bats              :string           default(""), not null
#  name              :string           default(""), not null
#  primary_stat_type :string           default(""), not null
#  status            :string           default(""), not null
#  throws            :string           default(""), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cpbl_player_id    :string           default(""), not null
#
class CpblPlayer < ApplicationRecord
end
