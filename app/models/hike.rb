# frozen_string_literal: true

class Hike < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  scope :my, ->(user) { where(user: user) }

  def normalize_friendly_id(name)
    name.to_slug.transliterate(:russian).normalize.to_s
  end
end
