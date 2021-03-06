class BookingsController < ApplicationController
  include BookingsHelper
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight])
    @passengers_count = params[:pax].to_i
    @passengers_count.times{ @booking.passengers.build }

  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Booking created successfully"
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "An error occurred"
      render 'new'
    end

  end

  def show
    @booking = Booking.find(params[:id])
  end
end
