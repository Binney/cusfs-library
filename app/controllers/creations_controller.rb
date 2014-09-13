class CreationsController < ApplicationController
  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(creation_params)
    if @creation.save
      flash[:success] = "Added #{@creation.name} to the Creative section!"
      redirect_to @creation
    else
      render 'new'
    end
  end

  def edit
    @creation = Creation.find(params[:id])
  end

  def update
    @creation = Creation.find(params[:id])
    if @creation.update_attributes(creation_params)
      flash[:success] = "Entry updated."
      redirect_to @creation
    else
      render 'edit'
    end
  end

  def index
    @creations = Creation.all.paginate(page: params[:page])
    @ttbas = Creation.all.where(medium: Creation::MEDIA[0])[0..5]
  end

  def ttba
    @creations = Creation.all.where(medium: Creation::MEDIA[0]).paginate(page: params[:page])
  end

  def chainwriting
    @creations = Creation.all.where(medium: Creation::MEDIA[2]).paginate(page: params[:page])
  end

  def show
    @creation = Creation.find(params[:id])
  end

  private

    def creation_params
      params.require(:creation).permit(:name, :description, :created_at, :medium, :url, :keywords)
    end

end