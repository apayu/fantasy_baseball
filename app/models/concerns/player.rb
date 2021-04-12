# frozen_string_literal: true

module Player
  extend ActiveSupport::Concern

  included do
    has_one :baseball_hitting_stat, as: :player, dependent: :destroy
  end
end
