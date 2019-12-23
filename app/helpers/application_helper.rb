# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def meta_product_name
    content_for?(:meta_product_name) ? content_for(:meta_product_name) : DEFAULT_META['meta_product_name']
  end
end
