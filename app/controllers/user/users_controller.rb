class User::UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = current_user
		@place = Place.find_by(id: current_user)
	end
	def edit
		@user = current_user
	end
	def update
	end
	def withdraw
	end
	def destroy
	end

end
