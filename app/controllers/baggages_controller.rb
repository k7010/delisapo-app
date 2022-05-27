class BaggagesController < ApplicationController

  def index
    @baggages = Baggage.includes(:user)
  end

  def new
    @baggage = Baggage.new
  end

  def create
    @baggage = Baggage.new(baggage_params)
    if @baggage.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @baggage = Baggage.find(params[:id])
    @delivery = Delivery.new
    @deliveries = @baggage.deliveries.includes(:user)
    #配達済み荷物のidを取得
    @result = Delivery.where(baggage_id: params[:id]).where(delivery_result: '配達済み').exists?
  end

  def search
    @q = Baggage.ransack(params[:q])
    @baggages = @q.result
  end


  private

  def baggage_params
    params.require(:baggage).permit(:address, :building, :block, :family_name, :first_name).merge(user_id: current_user.id)
  end
end
