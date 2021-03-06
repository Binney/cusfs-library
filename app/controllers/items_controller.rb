class ItemsController < ApplicationController
  include ItemsHelper
  require 'csv'
  before_action :admin_user, only: [:new, :create, :edit, :update, :download_catalogue, :destroy]

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    @item.editions ||= 'a'
    @item.title = chop_articles_from(@item.title)
  	if @item.save 
      flash[:success] = "Successfully added " + @item.pretty_name + " to the CUSFS Library!"
      redirect_to @item
  	else
  	  render 'new'
  	end
  end

  def show
  	@item = Item.find(params[:id])
    @reviews = @item.reviews
    if signed_in?
      @review = current_user.reviews.build
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

  def search
    index
    @title = "Search results" unless params[:q].empty?
    render 'index'
  end

  def index
    @search = Item.search(params[:q])
    #@search.sorts = 'name asc, author_name asc' if @search.sorts.empty? #TODO sort
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

  def films
    @items = Item.all.where(medium: Item::MEDIA[5]).paginate(page: params[:page])
    @title = "Films"
    render 'index'
  end

  def boardgames
    @items = Item.all.where(medium: Item::MEDIA[6]).paginate(page: params[:page])
    @title = "Board games"
    render 'index'
  end

  def download_catalogue
    @items = Item.all
    file = "CUSFS_catalogue_#{Time.now.to_formatted_s(:number)}.txt"
    CSV.open( file, 'w' ) do |writer|
      @items.each do |item|
      end
    end
  end

  def download
    puts "#{current_user.name} is downloading the library catalogue..."
    @items = Item.all
    @file = "CUSFS_catalogue.csv"
    CSV.open( @file, 'w' ) do |writer|
      writer << ["Title", "Author", "Year", "ISBN", "Location", "Notes", "Status", "Tag", "Series name", "Number in series"]
      @items.each do |item|
        status = (item.status == "-") ? item.availability_status : item.status
        author_name = item.author ? item.author.name : "?"
        series_name = item.series ? item.series.name : "?"
        writer << [item.title, author_name, item.date, item.isbn, item.location, item.notes, status, item.tag, series_name, item.series_number]
      end
    end
    send_file @file
  end

  def destroy
    Item.destroy(params[:id])
    flash[:success] = "Item destroyed. You monster."
    redirect_to items_path
  end

  private

    def item_params
      params.require(:item).permit(:title, :author, :author_id, :notes, :date, 
        :medium, :isbn, :description, :location, :status, :series, :series_id, 
        :series_number, :editions, :cover_url)
    end
end

# TODO: 
# 1) When an Item record is saved (new or old) need to find author_id or create a new one, depending.
# 2) When an Item is deleted, need to check whether that was the last book by a certain author so we don't get left with orphans.
# https://github.com/crowdint/rails3-jquery-autocomplete for edit and new forms