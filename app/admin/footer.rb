# frozen_string_literal: true

module ActiveAdmin
  module Views
    class Footer < Component
      def build(namespace)
        super id: 'footer'
        @namespace = namespace

        div do
          span(
            "#{Time.zone.now.year} Developed by " + 'Jan Czizikow'
          )
        end
      end
    end
  end
end
