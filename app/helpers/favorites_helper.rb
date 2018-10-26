# frozen_string_literal: true

module FavoritesHelper
  # def in_favorites?(hike)
  #   Favorite.find_by(user: current_user, hike: hike).present?
  # end

  def in_favorites(hike)
    Favorite.find_by(user: current_user, hike: hike) if user_signed_in?
  end
end
