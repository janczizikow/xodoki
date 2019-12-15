require "administrate/base_dashboard"

class HikeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    category: Field::BelongsTo,
    direction: Field::BelongsTo,
    photos: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    slug: Field::String,
    date: Field::DateTime,
    distance: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    kml: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  name
  slug
  category
  direction
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  name
  slug
  category
  direction
  description
  date
  distance
  created_at
  updated_at
  kml
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user
  category
  direction
  name
  description
  date
  distance
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how hikes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hike)
  #   "Hike ##{hike.id}"
  # end
end
