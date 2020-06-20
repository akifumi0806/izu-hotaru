class User::CommentsController < ApplicationController
	def create
		@place = Place.find(params[:place_id])
	    @comment = current_user.comments.new(comment_params)
	    @comment.place_id = @place.id
	    @comment.save
	    @comments = @place.comments
	end

	def destroy
		@place = Place.find(params[:place_id])
		@comment = Comment.find_by(id: params[:id], place_id: params[:place_id])
		@comment.destroy
		@comments = @place.comments
	end

	private
		def comment_params
		    params.require(:comment).permit(:body)
		end

end
