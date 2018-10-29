# frozen_string_literal: true

ActiveAdmin.register Hike do
  permit_params :user_id, :name, :description, :date, :distance

  before_action only: %i[show edit update destroy] do
    @hike = Hike.friendly.find(params[:id])
  end
end
