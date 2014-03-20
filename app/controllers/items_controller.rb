class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(params[:user])
  	if @item.save 
  		# It worked!
  	else
  	  render 'new'
      # Something went wrong!
  	end
  end 

  def show
  	@item = Item.find(params[:id])
  end
end
