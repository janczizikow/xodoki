# frozen_string_literal: true

class Direction < ApplicationRecord
  has_many :hikes, dependent: :restrict_with_error
  validates :name, uniqueness: {case_sensitive: false}
end
