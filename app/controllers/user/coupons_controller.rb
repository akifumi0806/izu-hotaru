class User::CouponsController < ApplicationController
	def create
		place = Place.find(params[:place_id])
		#if (place.favorites.count) >= ((place.coupons.count+1)*2)
			@coupon = Coupon.new(place_id: place.id)
			@coupon.save
			redirect_to user_place_coupon_path(place.id, @coupon.id)
			# render 'show'
		#else
			#redirect_to root_path
		#end
	end

	def show 
		@coupon = Coupon.find(params[:id])
	end
	
end
