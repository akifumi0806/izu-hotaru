class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@user = User.all
	end

	def destroy
		@user = User.find(params[:id])
    	@user.destroy
    	redirect_to admin_users_path
	end
end
