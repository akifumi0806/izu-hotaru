class Admin::PlacesController < ApplicationController

  def index
  	@places = Place.where(admin_id: true)
  end
  def new
  	@place = Place.new
  end

  def show
  	@place = Place.find(params[:id])
  end

  def create
  	@place = Place.new(place_params)
    @place.admin_id = current_admin.id
  	if @place.save!
  		redirect_to admin_place_path(@place)
  	else render :new
  	end
  end

  def edit
  	@place = Place.find(params[:id])
  end

  def update
  	@place = Place.find(params[:id])
  	if @place.update(place_params)
  		redirect_to admin_place_path(@place)
  	else render :edit
  	end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to admin_places_path
  end

  def map
    @places = Place.all
  end

  private
  	def place_params
  		params.require(:place).permit(:image, :placename, :explanation, :area, :type, :admiration_startmonth, :admiration_startseason, :admiration_finishmonth, :admiration_finishseason, :address, :tel, :officialsite, :parking, :access_car, :access_public, :event, :event_startmonth, :event_startday, :event_finishmonth, :event_finishday, :longitude, :latitude)
  	end
  
end