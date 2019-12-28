# frozen_string_literal: true

class HikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_hike, only: %i[show edit update destroy]

  def show
    @favorite = Favorite.new
    @photo = Photo.new
  end

  def new
    @hike = Hike.new
    authorize @hike
  end

  def create
    @hike = Hike.new(hike_params)
    @hike.user = current_user
    authorize @hike
    if @hike.save
      flash[:notice] = t('.hike_created')
      redirect_to @hike
    else
      flash[:alert] = @hike.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit; end

  def update
    @hike.remove_image! if hike_params[:remove_image]
    @hike.remove_kml! if hike_params[:remove_kml]
    if @hike.update(hike_params)
      flash[:notice] = t('.hike_updated')
      redirect_to @hike
    else
      flash[:alert] = @hike.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    if @hike.destroy
      flash[:notice] = t('.hike_removed')
      redirect_to root_path
    else
      flash[:alert] = @spot.errors.full_messages.join(', ')
      render :show
    end
  end

  private

  def set_hike
    @hike = Hike.friendly.find(params[:id])
    authorize @hike
  end

  def hike_params
    params.require(:hike).permit(
      :name, :description, :date, :distance,
      :image, :image_cache, :remove_image,
      :kml, :kml_cache, :remove_kml,
      :category_id, :direction_id,
      kmls_attributes: %i[id name file file_cache _destroy]
    )
  end
end
