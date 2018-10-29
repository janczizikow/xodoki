# frozen_string_literal: true

class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :included_in_header, -> { where(in_header: true) }
  scope :included_in_footer, -> { where(in_footer: true) }

  validates :title, :content, presence: true
  validates :title, uniqueness: {case_sensitive: false}

  def normalize_friendly_id(title)
    title.to_slug.transliterate(:russian).normalize.to_s
  end
end
