class BookingsController < ApplicationController
  before_action :set_listing, only: %i[new create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = @listing
    authorize @booking
    if @booking.save
      redirect_to listing_path(@listing)
    else
      render "listings/show", status: :unprocessable_entity
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :listing_id)
  end
end
