class CollectionsController < ApplicationController

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
	end

	def show
		@collection = Collection.find(params[:id])
		@items = @collection.items#.paginate(params[:page])
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
			params.require(:collection).permit(:name, :description, exhibits_attributes: [:id, :item_id, :_destroy])
		end

end
