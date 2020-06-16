class User::CouponsController < ApplicationController
	def index
		@coupon = Coupon.new(491234567890)
	end
end
