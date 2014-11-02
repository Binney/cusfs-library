class UsersController < ApplicationController
  before_action :sign_in_user # None of this is accessible without signing in first.
  before_action :admin_user, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :withdrawals, :requests, :reservations]
  include ApplicationHelper

  def new
  	@user = User.new
  end

  def create
    @pw = params[:user][:password]
  	@user = User.new(user_params)
  	if @user.save 
      flash[:success] = "Account created! An email has been sent to the provided address with login details."
      UserMailer.welcome_email(@user, @pw).deliver
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

  def checkout
    @user = current_user
  end

  def update
    puts user_params[:withdrawals_attributes]
    puts "Asdflfjkafj " + user_params[:withdrawals_attributes].to_s + user_params[:withdrawals_attributes].blank?.to_s
    if user_params[:withdrawals_attributes].blank?
      puts "Saving!"
      # Normal "update settings" update.
      if user_params[:password].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
      end

      @user = User.find(params[:id])
      if @user.update_attributes(user_params) 
        flash[:success] = "Updated successfully!"
        redirect_to @user
      else
        render 'edit'
      end

    else
      puts "Checking out!"
      # Withdrawing items via "checkout" action.
      smoothly = true
      user_params[:withdrawals_attributes].each do |i, withdrawal|
        puts withdrawal["user_id"]
        user = User.find(withdrawal[:user_id])
        item = Item.find(withdrawal[:item_id])
        puts withdrawal[:item_id]
        puts item.title + ", "
        smoothly = smoothly && user.withdraw!(withdrawal[:item_id], withdrawal[:edition])

        if user.withdrawals.length>total_books_limit # total_books_limit can be found in application_helper
          flash[:error] = "WARNING:  Having withdrawn #{item.pretty_name}, #{user.name} now has #{user.withdrawals.length} books withdrawn, which is more than the borrowing limit. Get them to return something!"
        end
      end

      if smoothly
        flash[:success] = "Withdrawals saved!"
        redirect_to withdrawals_path
      else
        @user = current_user
        render 'checkout'
      end

    end

  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def collections
    @user = User.find(params[:id])
    @collections = @user.collections
  end

  def reviews 
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def withdrawals
    @user = User.find(params[:id])
    @withdrawals = @user.withdrawals
  end

  def requests
    @user = User.find(params[:id])
    @requests = @user.requests
  end

  def reservations 
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :membership_expiry, withdrawals_attributes: [:id, :user_id, :item_id, :edition, :_destroy])
    end

    def correct_user
      sign_in_user
      puts params[:id]
      puts current_user.id
      if (params[:id].to_i == current_user.id.to_i) || current_user.admin?
        # Fine!
      else
        flash[:error] = "I'm sorry, #{current_user.name}. I'm afraid I can't do that."
        redirect_to root_path
      end
    end
end