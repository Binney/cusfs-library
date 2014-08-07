class AuthorsController < ApplicationController
  def index
  	@authors = Author.all.paginate(page: params[:page])
  end

  def show
  	@author = Author.find(params[:id])
  	@items = @author.items.reorder(:series_id, :series_number).paginate(page: params[:page])
  end
end

