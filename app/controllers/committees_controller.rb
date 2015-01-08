class CommitteesController < ApplicationController
	before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

	def new
		@committee = Committee.new
	end

	def create
	    @committee = Committee.new(committee_params)
	    if @committee.save
	      flash[:success] = "ALL HAIL THE NEW COMMITTEE."
	      redirect_to @committee
	    else
	      render 'new'
	    end		
	end

	def edit
		@committee = Committee.find(params[:id])
	end

	def update
		@committee = Committee.find(params[:id])
	    if @committee.update_attributes(committee_params)
	      flash[:success] = "Entry updated."
	      redirect_to @committee
	    else
	      render 'edit'
	    end
	end

	def index
		@committees = Committee.all.paginate(page: params[:page], per_page: 10)
	end

	def show
		@committee = Committee.find(params[:id])
	end

	def current
		@committee = Committee.first
		render 'show'
	end

	def destroy
		@committee = Committee.find(params[:id])
		if @committee.destroy
			flash[:success] = "Committee destroyed."
			redirect_to committees_path
		else
			redirect_to "/committees/#{@committee.id}"
		end
	end

	private

		def committee_params
			params.require(:committee).permit! # there really isn't anything dodgy in here
		end

end
