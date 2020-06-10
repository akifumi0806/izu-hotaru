class User::PlacesController < ApplicationController
	def index
		@places = Place.all
	end
	def show
		@place = Place.find(params[:id])
	end
	def new
		@place = Place.new
		p @place
	end
	def create
		@place = Place.new(place_params)
  	if @place.save!
  		redirect_to user_place_path(@place)
  	else render :new
  	end
	end
	def edit
	end
	def update
	end

	private
	def place_params
  		params.require(:place).permit(:image, :placename, :explanation, :area, :type)
  	end

end
