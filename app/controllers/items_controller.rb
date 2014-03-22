class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save 
      flash[:success] = "Successfully added " + @item.title + " to the CUSFS Library!"
      redirect_to @item
  	else
  	  render 'new'
  	end
  end 

  def show
  	@item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.paginate(page: params[:page])
  end

  private

    def item_params
      params.require(:item).permit(:title, :author, :notes, :date, :medium, :isbn, :location, :status)
    end
end
