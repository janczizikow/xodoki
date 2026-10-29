# frozen_string_literal: true

class KmlUploader < CarrierWave::Uploader::Base
  def extension_allowlist
    %w[kml kmz]
  end

  def size_range
    1..10.megabytes
  end
end
