class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing = @listing 
    if @reservation.save
      redirect_to current_user
    else
      @errors = @reservation.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @reservation.user 
  end


  def reservation_params
    params.require(:reservation).permit(:num_guests, :start_date, :end_date)
  end

end
