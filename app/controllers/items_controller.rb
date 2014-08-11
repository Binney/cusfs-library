class ItemsController < ApplicationController
  before_action :admin_or_signin, only: [:new, :create, :edit]

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
    @reviews = @item.reviews.paginate(page: params[:page])
    if signed_in?
      @review = @item.reviews.build
    end
    @collections = @item.collections
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.paginate(page: params[:page])
  end

  private

    def item_params
      params.require(:item).permit(:title, :author, :author_id, :notes, :date, :medium, :isbn, :location, :status)
    end
end

# TODO: 
# 1) When an Item record is saved (new or old) need to find author_id or create a new one, depending.
# 2) When an Item is deleted, need to check whether that was the last book by a certain author so we don't get left with orphans.
# https://github.com/crowdint/rails3-jquery-autocomplete for edit and new forms