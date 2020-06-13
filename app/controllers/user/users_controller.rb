class User::UsersController < ApplicationController
	def show
		@user = current_user
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
