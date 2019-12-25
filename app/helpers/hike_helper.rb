# frozen_string_literal: true

module HikeHelper
  def should_show_custom_icon?(hike)
    hike.category.name == 'Лыжный'
  end
end
