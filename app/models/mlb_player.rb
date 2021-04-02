# frozen_string_literal: true

# == Schema Information
#
# Table name: mlb_players
#
#  id                      :bigint           not null, primary key
#  bats                    :string           default(""), not null
#  name_display_first_last :string           default(""), not null
#  primary_stat_type       :string           default(""), not null
#  status                  :string           default(""), not null
#  throws                  :string           default(""), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  mlb_data_player_id      :string           default(""), not null
#
class MlbPlayer < ApplicationRecord; end
