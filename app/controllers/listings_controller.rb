class ListingsController < ApplicationController

  def index
  end

  # GET /listings/1
  def show
    authorize @listing
  end
end
