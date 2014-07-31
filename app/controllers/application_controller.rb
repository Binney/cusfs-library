class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	include SessionsHelper

	def admin_or_signin
		redirect_to root_path, notice: "You are not worthy. You shall not pass." unless signed_in? && current_user.admin?
	end  
end
