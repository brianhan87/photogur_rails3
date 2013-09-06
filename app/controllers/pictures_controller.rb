class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def show
		 @picture  = Picture.find(params[:id])
		 @comments = @picture.comments
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(params[:picture])
		if @picture.save
			redirect_to pictures_url
		else
			render :new
		end
	end

	# def picture_params
	# 	params.require(:picture).permit(:artist, :title, :url)

	# end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])

		if @picture.update_attributes(params[:picture])
			redirect_to "/pictures/#{@picture.id}"
		else
			render :edit
		end
	end

	def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

	
end
