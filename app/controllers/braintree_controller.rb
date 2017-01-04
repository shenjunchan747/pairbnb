class BraintreeController < ApplicationController
  
  def new
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
      )
  
    if result.success?
      # UserMailer.reservation_email(@current_user, @listing.user, @reservation_id).deliver_later
      redirect_to :root, :flash => {:success => "Transaction successful"}
    else
      redirect_to :root, :flash => {:error => "Transaction failed. Try again."}
    end
  end
end
