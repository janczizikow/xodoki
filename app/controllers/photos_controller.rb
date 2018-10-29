# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_hike
  before_action :set_photo, only: :destroy

  def create
    @photo = Photo.new(photo_params)
    @photo.hike = @hike
    @photo.user = current_user
    authorize @photo

    if @photo.save
      flash[:notice] = 'Photo Link added'
    else
      flash[:alert] = @photo.errors.full_messages.join(', ')
    end
    redirect_to @hike
  end

  def destroy
    if @photo.destroy
      flash[:notice] = 'Photo Link updated'
    else
      flash[:alert] = @photo.errors.full_messages.join(', ')
    end
    redirect_to @hike
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
    authorize @photo
  end

  def set_hike
    @hike = Hike.friendly.find(params[:hike_id])
  end

  def photo_params
    params.require(:photo).permit(:text, :link)
  end
end
