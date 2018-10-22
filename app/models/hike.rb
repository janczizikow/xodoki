# frozen_string_literal: true

class Hike < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :my, ->(user) { where(user: user) }

  belongs_to :user

  validates :name, :description, :date, :distance, presence: true

  def normalize_friendly_id(name)
    name.to_slug.transliterate(:russian).normalize.to_s
  end
end
