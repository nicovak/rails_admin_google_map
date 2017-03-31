require 'rails_admin_google_map/engine'

module RailsAdminGoogleMap
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class GoogleMap < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(self)

          def allowed_methods
            [@name]
          end

          register_instance_option(:partial) do
            :form_google_map
          end

          # Google Maps API Key - optional
          register_instance_option(:google_api_key) do
            nil
          end

          # Latitude value to display in the map if the latitude attribute is nil
          # (Otherwise the location defaults to (0,0) which is in the Gulf of Guinea
          register_instance_option(:default_latitude) do
            51.5 # Latitude of London, United Kingdom
          end

          # Longitude value to display if the longitude attribute is nil
          register_instance_option(:default_longitude) do
            -0.126
          end

          # Default zoom level of the map
          register_instance_option(:default_zoom_level) do
            8
          end

          register_instance_option :formatted_value do
            value.present? ? JSON.pretty_generate(value) : nil
          end

          def dom_name
            @dom_name ||= "#{bindings[:form].object_name}_#{@name}_google_map_field"
          end

          def parse_value(value)
            value.present? ? JSON.parse(value) : nil
          end

          def parse_input(params)
            params[name] = parse_value(params[name]) if params[name].is_a?(::String)
          end
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
end
