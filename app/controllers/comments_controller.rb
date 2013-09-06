class CommentsController < ApplicationController
	before_filter :fetch_picture

	def show
		 
	end

	def create
		# Long way
		# @comment = Comment.create(:picture_id => params[:picture_id])
		# @comment.text = params[:comment][:text]

		# Rails way
		@comment = @picture.comments.create(params[:comment])

		if @comment
			redirect_to picture_path(@picture)
		else
			render 'pictures/show', :alert => "Comment was bogus."
		end
	end

	def destroy
	end

	private
	def fetch_picture
		@picture = Picture.find(params[:picture_id])
	end
end
