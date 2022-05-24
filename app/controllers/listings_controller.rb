class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /listings
  def index
    # Usually we do Listings.all to see the index.
    # Instead we want to use the resolve action defined in the listing_policy.rb
    @listings = policy_scope(Listing)
  end

  # GET /listings/1
  def show
    @listing = Listing.find(params[:id])
    authorize @listing
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

  private

  def listing_params
    params.require(:listing).permit(:style, :category, :description, :price_per_day, :city)
  end
end
