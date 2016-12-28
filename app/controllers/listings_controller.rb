class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update]

  def index
    # @listings = Listing.all
    @listings = Listing.all.paginate(:page => params[:page], per_page: 5) 
  end


  def new 
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to listings_path 
    else 
      redirect_to new_listing_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update_attributes(listing_params)
      flash[:notice] = "Successfully Updated"
      redirect_to @listing
    else
      flash[:notice] = @user.errors.full_messages
      render 'edit'
    end
      
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

   def delete_listing
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :max_guests, :price, :user_id)
  end



end
