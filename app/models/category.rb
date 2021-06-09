# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :hikes
  validates :name, uniqueness: {case_sensitive: false}
end
