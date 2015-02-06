class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	include SessionsHelper
	include QuotesHelper
	before_filter :create_search
	before_filter :routing_wtf
	before_filter :pick_a_quote

	def admin_user
		redirect_to root_path, notice: "You are not worthy. You shall not pass." unless signed_in? && current_user.admin?
	end

	def sign_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "They who would cross the Bridge of Death must answer me this question: What... is your name?"
      end
    end

	def create_search
		@search = Item.search(name_cont: params[:q])
	end

	def routing_wtf
		if request.host=="www.srcf.ucam.org"
			puts "You're visiting via a deprecated route and so are being redirected to the proper one...!"
			redirect_to "http://cusfs.soc.srcf.net#{request.fullpath}"
		end
	end

	def pick_a_quote
		@quote = all_quotes[rand(all_quotes.length-1)]
	end

end
