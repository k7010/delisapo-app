class BaggagesController < ApplicationController

  def index
    @baggages = Baggage.includes(:user)
    @results = Baggage.joins(:deliveries).select("baggages.*, deliveries.*").where("delivery_result = '配達済み'")
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
    @results = Baggage.joins(:deliveries).select("baggages.*, deliveries.*").where("delivery_result = '配達済み'")
                                          .where(address: @baggage.address).where(block: @baggage.block)
                                          .where(family_name: @baggage.family_name).where(first_name: @baggage.first_name)
  end

  def search
    @q = Baggage.ransack(params[:q])
    @baggages = @q.result
    @results = Baggage.joins(:deliveries).select("baggages.*, deliveries.*").where("delivery_result = '配達済み'")
  end


  private

  def baggage_params
    params.require(:baggage).permit(:address, :building, :block, :family_name, :first_name).merge(user_id: current_user.id)
  end
end
