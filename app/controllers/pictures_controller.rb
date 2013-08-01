class PicturesController < ApplicationController
before_filter :authenticate_user!, only: [:create, :destroy]

   def index
      @status = Status.find(params[:status_id])
      @slide = Slide.find(params[:slide_id])
      @picture = Picture.all
   end

  def create
    @slide = Slide.find(params[:slide_id])
    @picture = @slide.pictures.create(params[:picture])
    redirect_to :back
  end

  def show
  @status = Status.find(params[:status_id])
  @slide = Slide.find(params[:status_id])
  redirect_to status_path
  end

  def destroy
    @slide = Slide.find(params[:slide_id])
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Successfully deleted picture."
    redirect_to :back
  end
end