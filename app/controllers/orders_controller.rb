class OrdersController < ApplicationController
  before_action :set_gear

  def index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gear
    @gear = Gear.find(params[:gear_id])
  end
end
