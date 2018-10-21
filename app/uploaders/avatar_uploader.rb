# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.
  version :default do
    cloudinary_transformation width: 160, height: 160, crop: :thumb, gravity: :face
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
