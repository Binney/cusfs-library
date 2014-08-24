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

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params) 
      flash[:success] = "Updated entry."
      redirect_to @item
    else
      render 'edit'
    end
  end

  def index
    @search = Item.search(params[:q])
    @items = @search.result.paginate(page: params[:page])
    @title = "All items"
  end

  def fiction
    @items = Item.all.where(medium: Item::MEDIA[0]).paginate(page: params[:page])
    @title = "Fiction"
    render 'index'
  end

  def graphic_novels
    @items = Item.all.where(medium: Item::MEDIA[1]).paginate(page: params[:page])
    @title = "Graphic novels"
    render 'index'
  end

  def tie_ins
    @items = Item.all.where(medium: Item::MEDIA[2]).paginate(page: params[:page])
    @title = "Tie-ins"
    render 'index'
  end

  def anthologies
    @items = Item.all.where(medium: Item::MEDIA[3]).paginate(page: params[:page])
    @title = "Anthologies"
    render 'index'
  end

  def nonfiction
    @items = Item.all.where(medium: Item::MEDIA[4]).paginate(page: params[:page])
    @title = "Non-fiction"
    render 'index'
  end
  def 

  def films
    @items = Item.all.where(medium: Item::MEDIA[5]).paginate(page: params[:page])
    @title = "Films"
    render 'index'
  end

  def games
    @items = Item.all.where(medium: Item::MEDIA[6]).paginate(page: params[:page])
    @title = "Games"
    render 'index'
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