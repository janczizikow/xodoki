# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_hike, only: %i[create destroy]
  before_action :set_favorite, only: :destroy

  def index
    @favorites = policy_scope(Favorite)
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    authorize @favorite
    if @favorite.save
      flash[:notice] = t('.hike_added_to_favorites')
    else
      flash[:alert] = @favorite.errors.full_messages.join(', ')
    end
    redirect_to @hike
  end

  def destroy
    if @favorite.destroy
      flash[:notice] = t('.hike_removed_from_favorites')
    else
      flash[:alert] = @favorite.errors.full_messages.join(', ')
    end
    redirect_to @hike
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
    authorize @favorite
  end

  def set_hike
    @hike = Hike.friendly.find(params[:hike_id])
  end

  def favorite_params
    params.require(:favorite).permit(:hike_id)
  end
end
