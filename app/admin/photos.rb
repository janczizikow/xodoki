# frozen_string_literal: true

ActiveAdmin.register Photo do
  permit_params :user_id, :hike_id, :text, :link
end
