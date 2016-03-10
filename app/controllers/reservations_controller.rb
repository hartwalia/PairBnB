require 'date'

class ReservationsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :delete]

  def index
    @reservations = Reservation.where("user_id = ?", params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @reservation = current_user.reservations.new
  end

  def create
    listing = Listing.find(params[:reservation][:listing_id])

    start_date = params[:reservation][:check_in]
    end_date = params[:reservation][:check_out]

    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)

    duration = (end_date - start_date).to_i

    total_cost = listing.price * duration

    paid = false
 
    @reservation = current_user.reservations.new(listing_id: listing.id, check_in: start_date, check_out: end_date, duration: duration, total_cost: total_cost, paid: paid)
 
    if @reservation.save
      ReservationJob.perform_async(@reservation.id)
      redirect_to @reservation
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @reservation = Reservation.find_by("user_id = ?", @reservation.user_id)
  end

  def update
  end

  def destroy
  end

  private

    def find_listing
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :check_in, :check_out, :paid)
    end
end