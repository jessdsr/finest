class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_listing, only: %i[show edit update destroy]

  # For turbo frames
  def forms; end

  # GET /listings
  def index
    # Usually we do Listings.all to see the index.
    # Instead we want to use the resolve action defined in the listing_policy.rb
    @listings = policy_scope(Listing)
  end

  # GET /listings/1
  def show
    authorize @listing

    @marker = @listing.geocoded.map do |f|
      {
        lat: f.latitude,
        lng: f.longitude
      }
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    authorize @listing
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /listings/1/edit
  def edit
    authorize @listing
  end

  # PATCH /restaurants/1
  def update
    @listing.user = current_user
    authorize @listing
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Furniture was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1

  def destroy
    authorize @listing
    @listing.destroy
    redirect_to listings_path, notice: "Furniture was successfully deleted"
  end

  private

  def listing_params
    params.require(:listing).permit(:category, :style, :description, :price_per_day, :city, :photo)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
