# frozen_string_literal: true

class Kml < ApplicationRecord
  mount_uploader :file, KmlUploader
  belongs_to :hike

  validates :file, presence: true
end
