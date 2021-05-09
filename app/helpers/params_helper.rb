# frozen_string_literal: true

module ParamsHelper
  def search_params(order_by)
    desc = params['desc'] == 'y' ? 'n' : 'y'
    params.permit(:name, :position_id, :order_by, :desc).merge({order_by: order_by, desc: desc}).to_h
  end
end
