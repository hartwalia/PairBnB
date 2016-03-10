class ListingsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :delete]

  def index
    
    if params[:user_id].nil?
      @listings = Listing.all
      @title = "Welcome Home"
      @user = nil
    else
      @listings = Listing.where("user_id = ?", params[:user_id])
      @title = "Your Listings"
      @user = User.find(params[:user_id])
    end

  end

  def new
    @listing = current_user.listings.new
  end

  def create 
    @listing = current_user.listings.new(listing_params)
 
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end

  end

  def edit
  end

  def show
    
    if params[:user_id].nil?
      @listing = Listing.find(params[:id])
    else
      @listing = Listing.find_by("user_id = ?", params[:user_id])
    end

    @user = User.find(@listing.user_id)

  end

  private

    def find_listing
      @listing = Listing.find(params[:id])
    end

	  def listing_params
	    params.require(:listing).permit(:name, :description, :city, :property_type, :room_type, :accommodates, :bedrooms, :beds, :bathrooms, :price, :user_id, {images: []})
	  end
end
