class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = SearchesLocations.new(query: params[:q]).call
  end

  def show
    @crimes = ShowCrime.new(query: params[:q]).query
    @info = ShowInfo.new
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    service = CreatesLocation.new(location_params.to_h)
    service.call
    @location = service.location

    if service.success?
      redirect_to @location, notice: 'Location successfully created.'
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy

    redirect_to locations_url, notice: 'Location successfully destroyed.'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:title, :address, :city, :state)
  end
end
