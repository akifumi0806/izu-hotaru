class HomesController < ApplicationController
	def top
		@places = Place.all
	end

	def about
	end

	def attention
	end
	
  	private
  	def place_params
  		params.require(:place).permit(:image, :placename, :explanation, :area, :type, :admiration_startmonth, :admiration_startseason, :admiration_finishmonth, :admiration_finishseason, :address, :tel, :officialsite, :parking, :access_car, :access_public, :event, :event_startmonth, :event_startday, :event_finishmonth, :event_finishday, :longitude, :latitude)
  	end
end
