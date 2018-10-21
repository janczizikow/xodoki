# frozen_string_literal: true

class HikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_hike, only: %i[show edit update destroy]

  def show; end

  def new
    @hike = Hike.new
    authorize @hike
  end

  def create
    @hike = Hike.new(hike_params)
    @hike.user = current_user
    authorize @hike
    if @hike.save
      flash[:notice] = 'Hike created'
      redirect_to @hike
    else
      flash[:alert] = @hike.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @hike.update(hike_params)
      flash[:notice] = 'Hike updated'
      redirect_to @hike
    else
      flash[:alert] = @hike.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @hike.destroy
      flash[:notice] = 'Hike removed'
      redirect_to root_path
    else
      flash[:alert] = @spot.errors.full_messages
      render :show
    end
  end

  private

  def set_hike
    @hike = Hike.friendly.find(params[:id])
    authorize @hike
  end

  def hike_params
    params.require(:hike).permit(:name, :description, :date, :distance)
  end
end
