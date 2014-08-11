class ExhibitsController < ApplicationController
before_filter :signed_in

  def create
  	@item = Item.find(params[:exhibit][:item_id])
    @collection = Collection.find(params[:exhibit][:collection_id])
  	@collection.add_item(@item)
    flash[:success] = "Added #{@item.title} to #{@collection.name}."
  	redirect_to @collection
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @item = @exhibit.item
    @collection = @exhibit.collection
    @collection.remove_item(@item)
    flash[:success] = "Removed #{@item.title} from #{@collection.name}."
    redirect_to @collection
  end

  private

    def signed_in
      unless signed_in?
        flash[:error] = "Please sign in."
        redirect_to signin_path
      end
    end

end
