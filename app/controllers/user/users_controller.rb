class User::UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = current_user
		@place = Place.where(user_id: current_user)
	end
	def edit
		@user = current_user
	end
	def update
	end
	def destroy
		@user = User.find(params[:id])
    	@user.destroy
    	redirect_to root_path
	end

end
