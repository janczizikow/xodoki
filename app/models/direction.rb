# frozen_string_literal: true

class Direction < ApplicationRecord
  has_many :hikes
  validates :name, uniqueness: {case_sensitive: false}
end
