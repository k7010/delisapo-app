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


  private

  def baggage_params
    params.require(baggage).permit(:address_id, :building, :block, :family_name, :first_name)
  end
end
