class UsersController < ApplicationController
  before_filter :sign_in_user # None of this is accessible without signing in first.
  before_filter :admin_user, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
      flash[:success] = "Account created! An email has been sent to the provided address with login details."
      # TODO email new user with account details
      redirect_to @user
  	else
  	  render 'new'
  	end
  end 

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) 
      flash[:success] = "Updated successfully!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def withdrawals
    @user = User.find(params[:id])
    @withdrawals = @user.withdrawals
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :membership_expiry)
    end
end