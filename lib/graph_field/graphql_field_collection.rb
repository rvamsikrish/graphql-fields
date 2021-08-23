require_relative 'graphql_field_information'
module GraphFieldCollection
  module ClassMethods
    include GraphqlFieldInformation::ClassMethods
    def collection(*fields)
      declare_collection(*fields)
      define_collection(*fields)
    end

    def declare_collection(*fields)
      fields.each do |field|
        build_field_collection(field)
      end
    end

    def build_field_collection(field)
      field field, [field_type(field)], null: true
    end

    def define_collection(*fields)
      fields.each do |field|
        define_method("#{field}") do
          object.send("#{field}")
        end
      end
    end
  end

end