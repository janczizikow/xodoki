# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  version :default do
    process resize_to_fill: [160, 160]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def size_range
    1..5.megabytes
  end
end
