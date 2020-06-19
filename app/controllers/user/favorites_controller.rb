class User::FavoritesController < ApplicationController
	def create
		@place = Place.find(params[:place_id])
		favorite = current_user.favorites.new(place_id: @place.id)
		favorite.save
	end
	def destroy
		@place = Place.find(params[:place_id])
		favorite = current_user.favorites.find_by(place_id: @place.id)
		favorite.destroy!
	end

end
