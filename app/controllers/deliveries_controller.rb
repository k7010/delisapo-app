class DeliveriesController < ApplicationController

  def create
    delivery = Delivery.create(delivery_params)
    redirect_to root_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:delivery_result).merge(user_id: current_user.id, baggage_id: params[:baggage_id])
  end
end
