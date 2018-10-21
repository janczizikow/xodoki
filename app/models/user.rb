# frozen_string_literal: true

class User < ApplicationRecord
  # Others devise modules:
  # :registerable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :hikes, dependent: :destroy
end
