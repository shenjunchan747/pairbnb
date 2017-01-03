class UsersController < Clearance::UsersController

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @reservations = @user.reservations
  end

  def edit
     @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully Updated"
    else
      flash[:notice] = @user.errors.full_messages
    end
      render 'edit'
  end


private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :encrypted_password, :confirmation_token,:avatar)
  end
end