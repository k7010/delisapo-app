class BaggagesController < ApplicationController

  def index
    @baggages = Baggage.all
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
  end


  private

  def baggage_params
    params.require(:baggage).permit(:address_id, :building, :block, :family_name, :first_name).merge(user_id: current_user.id)
  end
end
