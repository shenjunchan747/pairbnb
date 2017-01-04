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

      PendingEmailJob.perform_later(current_user,current_user.reservations.find_by(params[:listing_id]).user, @reservation_id)
      redirect_to :root, :flash => {:successful => "Transaction successful"}
    else
      redirect_to :root, :flash => {:error => "Transaction failed. Try again."}
    end
  end
end
