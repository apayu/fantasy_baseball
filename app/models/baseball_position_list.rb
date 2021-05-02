# frozen_string_literal: true

class BaseballPositionList < ActiveYaml::Base
  set_root_path Rails.root.join('config')
  set_filename 'baseball_position_list'
end
