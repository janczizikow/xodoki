# frozen_string_literal: true

module ActiveAdmin
  module Views
    class Footer < Component
      def build(namespace)
        super id: 'footer'
        @namespace = namespace

        div do
          span (
            "#{Time.zone.now.year} Developed by " + link_to('Jan Czizikow', 'https://www.janczizikow.com')
          ).html_safe
        end
      end
    end
  end
end
