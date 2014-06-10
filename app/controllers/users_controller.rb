class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
      sign_in @user
      flash[:success] = "Account created. Welcome to CUSFS, " + @user.name + "!"
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

  def index
    @users = User.all.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end