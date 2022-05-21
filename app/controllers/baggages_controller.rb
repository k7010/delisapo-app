class BaggagesController < ApplicationController

  def index
    @baggages = Baggage.all
  end

  def new
    @baggage = Baggage.new
  end
end
