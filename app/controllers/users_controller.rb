class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Calendar!"
      redirect_to @user
    else
      render 'new'
    end

  end

  private

    def user_params
      params.require(:user).permit(:login, :first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

end
