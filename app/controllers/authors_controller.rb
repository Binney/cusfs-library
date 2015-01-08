class AuthorsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :download_authors, :destroy]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author created."
      redirect_to @author
    else
      render 'new'
    end
  end

  def index
  	@authors = Author.all.paginate(page: params[:page])
  end

  def show
  	@author = Author.find(params[:id])
  	@items = @author.items.reorder(:series_id, :series_number).paginate(page: params[:page])
  end

  def edit
  	@author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params) 
      flash[:success] = "Updated entry."
      redirect_to @author
    else
      render 'edit'
    end
  end

  def download
    puts "#{current_user.name} is downloading the list of authors..."
    @authors = Author.all
    @file = "CUSFS_authors.csv"
    CSV.open( @file, 'w' ) do |writer|
      writer << ["Name", "Number of titles in library"]
      @authors.each do |author|
        bibliography = author.items.length
        writer << [author.name, bibliography]
      end
    end
    send_file @file
  end

  def destroy
    Author.destroy(params[:id])
    flash[:success] = "Author destroyed. You monster."
    redirect_to series_index_path
  end

  private

  	def author_params
  		params.require(:author).permit(:name)
  		# TODO should you be able to add books directly under the Author page via a nested form? if so obviously params will have to change a bit
  	end

end

