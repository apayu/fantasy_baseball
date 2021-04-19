# frozen_string_literal: true

module Player
  extend ActiveSupport::Concern

  included do
    has_one :baseball_hitting_stat, as: :player, dependent: :destroy
    has_one :baseball_pitching_stat, as: :player, dependent: :destroy
    enum status: { not_active: 0, active: 1, injured_list: 2 }
  end
end
