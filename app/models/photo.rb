# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :hike

  validates :text, :link, presence: true
  validates :link, format: {
    with: %r{(photo|plus).google.com\/photos\/.*}i,
    message: 'Разрешены только ссылки из Google Фото.'
  }
end
