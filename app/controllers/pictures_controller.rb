class PicturesController < ApplicationController
  def create
    @slide = Slide.find(params[:slide_id])
    @picture = @slide.pictures.create(params[:picture])
    redirect_to :back
  end

  def destroy
    @slide = Slide.find(params[:slide_id])
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Successfully deleted picture."
    redirect_to :back
  end
end