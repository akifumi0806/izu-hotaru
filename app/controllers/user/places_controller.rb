class User::PlacesController < ApplicationController
	before_action :authenticate_user!


	def index
		@places = Place.all

	end
	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
		

	end
	def new
		@place = Place.new
	end
	def create
		@place = Place.new(place_params)
		@place.user_id = current_user.id
  	if @place.save!
  		redirect_to user_place_path(@place)

  	else render :new
  	end
	end
	def edit
		@place = Place.find(params[:id])
	end
	def update
		@place = Place.find(params[:id])
  		if @place.update(place_params)
  			redirect_to user_place_path(@place)
	  	else render :edit
	  	end
	end
	def destroy
	    place = Place.find(params[:id])
	    place.destroy
	    redirect_to user_places_path
  	end

	private
	def place_params
  		params.require(:place).permit(:image, :placename, :explanation, :area, :type, :address, :longitude, :latitude)
  	end

end
