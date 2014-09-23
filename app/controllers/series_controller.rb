class SeriesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@series = Series.all[1..-1].paginate(page: params[:page])
  end

  def show
  	@series = Series.find(params[:id])
  	@items = @series.items.reorder(:series_number).paginate(page: params[:page])
  end

  def new
  	@series = Series.new
  end

  def create
  	@series = Series.new(series_params)
  	if @series.save
  		flash[:success] = "Series created!"
  		redirect_to @series
  	else
  		render 'new'
  	end
  end

  def edit
  	@series = Series.find(params[:id])
  end

  def update
  	@series = Series.find(params[:id])
  	if @series.update_attributes(series_params)
  		flash[:success] = "Series updated."
  		redirect_to @series
  	else
  		render 'edit'
  	end
  end

  def destroy
    Series.destroy(params[:id])
    flash[:success] = "Series destroyed."
    redirect_to series_index_path
  end

  private

  	def series_params
  		params.require(:series).permit(:name)
  	end
  
end
