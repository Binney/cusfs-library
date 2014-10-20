class CollectionsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

	def new
		@collection = Collection.new
		@collection.exhibits.build
	end

	def create
		@collection = current_user.collections.build(collection_params)
		if @collection.save
			flash[:success] = "List created!"
			redirect_to @collection
		else
			render 'new'
		end
	end

	def index
		@collections = Collection.all.paginate(page: params[:page])
		@title = "All lists"
	end

	def recommendations
		@collections = Collection.all[0..11].paginate(page: params[:page])
		@title = "CUSFS Official Recommendations"
		render 'index'
	end

	def show
		@collection = Collection.find(params[:id])
		@exhibits = @collection.exhibits
	end

	def edit
		@collection = Collection.find(params[:id])
	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(collection_params)
			flash[:success] = "List saved!"
			redirect_to @collection
		else
			render 'edit'
		end
	end

	private

		def collection_params
			params.require(:collection).permit(:name, :description, exhibits_attributes: [:id, :item_id, :_destroy, :explanation])
		end

		def correct_user
			sign_in_user
			unless current_user.admin? || Collection.find(params[:id]).user_id == current_user.id
				flash[:error] = "I'm sorry, #{current_user.name}. I'm afraid I can't do that."
				redirect_to root_path
			end
		end

end
