# frozen_string_literal: true

class Hike < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId

  friendly_id :name, use: :slugged
  mount_uploader :kml, KmlUploader
  mount_uploader :image, ImageUploader

  scope :my, ->(user) { where(user: user) }
  scope :category, ->(params) { where(category_id: params[:category_id]) }
  scope :direction, ->(params) { where(direction_id: params[:direction_id]) }
  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :past, -> { where('date < ?', Time.zone.now) }
  pg_search_scope :search,
                  against: %i[name description],
                  using: {
                    tsearch: {prefix: true}
                  }

  belongs_to :user
  belongs_to :category
  belongs_to :direction
  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, :description, :date, :distance, presence: true

  def normalize_friendly_id(name)
    name.to_slug.transliterate(:russian).normalize.to_s
  end
end
