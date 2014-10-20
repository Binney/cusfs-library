class SessionsController < ApplicationController
  before_action :signed_in_already, only: [:new, :create]

	def new
	end

	def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        flash[:success] = "Welcome back, #{user.name}"
        redirect_back_or user
      else
        flash.now[:error] = 'Invalid email/password combination.'
        render 'new'
      end
    end

	def destroy
    sign_out
    redirect_to root_url
	end

  private

    def signed_in_already
      if signed_in?
        flash[:error] = "You're already signed in!"
        redirect_to current_user
      end
    end

end
