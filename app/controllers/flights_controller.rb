class FlightsController < ApplicationController
  include FlightsHelper
  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      @available_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], scheduled_on: selected_date.all_day)
    end
  end

  # def new
  #   @flight = Flight.new
  # end

  # def create
  #   @flight = Flight.new(flight_params)
  #   @flight.save
  #   flash[:notide] = "Your flight has been created"
  #   redirect_to root_path
  # end
end
