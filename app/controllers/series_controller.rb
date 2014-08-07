class SeriesController < ApplicationController
  def index
  	@series = Series.all.paginate(page: params[:page])
  end

  def show
  	@series = Series.find(params[:id])
  	@items = @series.items.reorder(:series_number).paginate(page: params[:page])
  end
end
