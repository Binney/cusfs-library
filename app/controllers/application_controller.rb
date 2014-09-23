class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	include SessionsHelper
	before_filter :create_search

	def admin_user
		redirect_to root_path, notice: "You are not worthy. You shall not pass." unless signed_in? && current_user.admin?
	end

	def sign_in_user
		redirect_to signin_path, notice: "They who would cross the Bridge of Death must answer me this question: What... is your name?" unless signed_in?
	end

	def create_search
		@search = Item.search(name_cont: params[:q])
	end
end
