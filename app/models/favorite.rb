# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  validates :hike, uniqueness: {scope: :user}
end
