require_relative 'graphql_field_collection'
require_relative 'graphql_field_resource'
module GraphqlFieldAssociation
  module ClassMethods
    include GraphFieldCollection::ClassMethods
    include GraphqlFieldResource::ClassMethods

    def association(*fields)
      resources(*fields)
      collection(*plural(*fields))
    end

    def association_custom_id(key,type,*fields)
      resources_custom_id(key,type,*fields)
      collection(*plural(*fields))
    end

    def plural(*fields)
      fields.collect { |field| field.to_s.pluralize.to_sym}
    end
  end
end