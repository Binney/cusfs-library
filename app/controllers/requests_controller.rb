class RequestsController < ApplicationController
	before_action :sign_in_user
	before_action :correct_user, only: [:edit, :update, :destroy]

	def new
		@request = Request.new
	end

	def create
		@user = User.find(params[:request][:user_id])
		@request = @user.requests.build(request_params)
		if @request.save
			# TODO email librarian to say an item's been requested? that seems excessive
			flash[:success] = "Request saved. The Librarian will let you know if CUSFS obtains a copy of #{@request.title}."
			redirect_to requests_user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
		if @request.update_attributes(request_params)
			flash[:success] = "Updated request."
			redirect_to requests_user_path(@request.user)
		else
			render 'edit'
		end
	end

	def index
		@requests = Request.all.paginate(page: params[:page])
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy
		flash[:success] = "Destroyed request."
		redirect_to requests_path
	end

	private

		def request_params
			params.require(:request).permit(:title, :notes)
		end

		def correct_user
			sign_in_user
			unless current_user.admin? || Request.find(params[:id]).user_id == current_user.id
				flash[:error] = "I'm sorry, #{current_user.name}. I'm afraid I can't do that."
				redirect_to root_path
			end
		end
end
