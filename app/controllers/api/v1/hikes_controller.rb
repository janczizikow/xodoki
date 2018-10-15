# frozen_string_literal: true

module Api
  module V1
    class HikesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]
      before_action :set_hike, only: %i[show update destroy]

      def index
        @hikes = policy_scope(Hike).order('date DESC')
        authorize @hikes
        render json: @hikes, status: :ok
      end

      def show
        render json: @hike, status: :ok
      end

      def create
        @hike = Hike.new(hike_params)
        authorize @hike
        if @hike.save
          render json: @hike, status: :created
        else
          render json: @hike.errors, status: :unprocessable_entity
        end
      end

      def update
        if @hike.update(hike_params)
          render json: @hike, status: :ok
        else
          render json: @hike.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @hike.destroy
          head :no_content
        else
          render json: @hike.errors, status: :unprocessable_entity
        end
      end

      private

      def set_hike
        @hike = Hike.friendly.find(params[:id])
        authorize @hike
      end

      def hike_params
        parms.require(:hike).permit(:title, :description, :date, :type)
      end
    end
  end
end
