class TransactionsController < ApplicationController
  
  before_action :require_login

  def new
  	@reservation = Reservation.find(params[:reservation_id])
    gon.client_token = Braintree::ClientToken.generate
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: @reservation.total_cost
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.purchase_cart_movies!

    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end
end
