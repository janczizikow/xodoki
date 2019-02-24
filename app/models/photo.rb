# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :hike

  validates :text, :link, presence: true
  validates :link, format: {
    with: %r{\A(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?\z}i,
    message: 'Неправильная ссылка.'
  }
end
