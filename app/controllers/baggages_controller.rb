class BaggagesController < ApplicationController
  before_action :ensure_current_user, only: [:show]

  def index
    if user_signed_in?
      @baggages = Baggage.where(user_id: current_user.id).includes(:user)
      @results = Baggage.joins(:deliveries).select("baggages.*, deliveries.*").where("delivery_result = '配達済み'")
    else
      @baggages = Baggage.includes(:user)
    end
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
    @result = Delivery.where(baggage_id: params[:id]).where(delivery_result: '配達済み').exists?
  end

  def destroy
    baggage = Baggage.find(params[:id])
    baggage.destroy
    redirect_to root_path
  end

  def search
    @q = Baggage.joins(:deliveries).select("baggages.*, deliveries.*").where("delivery_result = '配達済み'").ransack(params[:q])
    @baggages = @q.result.order(id: "DESC")
  end


  private

  def baggage_params
    params.require(:baggage).permit(:address, :building, :block, :family_name, :first_name, :time_specification).merge(user_id: current_user.id)
  end

  def ensure_current_user
    @baggage = Baggage.find(params[:id])
    unless @baggage.user.id == current_user.id
      redirect_to root_path
    end
  end
end
