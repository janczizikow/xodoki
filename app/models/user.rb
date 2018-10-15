# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :username, presence: true

  mount_uploader :avatar, AvatarUploader

  has_many :hikes, inverse_of: :user, dependent: :destroy
end
