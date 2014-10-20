class ReservationsController < ApplicationController
	before_action :sign_in_user
	before_action :correct_user, only: [:edit, :update, :destroy]

	def new
		@reservation = Reservation.new
	end

	def create
		@user = User.find(params[:reservation][:user_id])
		@reservation = @user.reservations.build(reservation_params)
		if @reservation.save
			flash[:success] = "Reserved #{@reservation.item.title}."
			@item = @reservation.item
			if @item.is_available?
				# Email the Librarian to ask to deliver the book.
				UserMailer.please_deliver_item_email(@user, @item, @reservation.notes).deliver
			else
				# Email existing possessor.
				@possessor = User.find(@item.withdrawals[0].user_id)
				UserMailer.please_return_item_email(@possessor, @item).deliver
			end
			redirect_to reservations_user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		if @reservation.update_attributes(reservation_params)
			flash[:success] = "Updated reservation."
			redirect_to reservations_user_path(@reservation.user)
		else
			render 'edit'
		end
	end

	def index
		@reservations = Reservation.all.paginate(page: params[:page])
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@user = @reservation.user
		@reservation.destroy
		flash[:success] = "Destroyed reservation."
		redirect_to reservations_user_path(@user)
	end

	private

		def reservation_params
			params.require(:reservation).permit(:item_id, :notes)
		end

		def correct_user
			sign_in_user
			unless current_user.admin? || Reservation.find(params[:id]).user_id == current_user.id
				flash[:error] = "I'm sorry, #{current_user.name}. I'm afraid I can't do that."
				redirect_to root_path
			end
		end
end
