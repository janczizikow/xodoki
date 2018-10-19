# frozen_string_literal: true

class Hike < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  serialize :type, Array

  belongs_to :user, inverse_of: :hikes

  validates :title, :description,
    :date,
    # :type,
    :user, presence: true

  def normalize_friendly_id(title)
    title.to_slug.transliterate(:russian).normalize.to_s
  end

  def slug_candidates
    [
      :title,
      %i[title date],
      %i[title date type]
    ]
  end
end
