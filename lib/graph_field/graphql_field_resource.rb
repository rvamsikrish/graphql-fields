module GraphqlFieldResource
  module ClassMethods
    include GraphqlFieldInformation::ClassMethods
    def resources(*fields)
      declare_resources(*fields)
      define_resources(*fields)
    end

    def declare_resources(*fields)
      fields.each do |field|
        build_field(field,:id)
      end
    end

    def define_resources(*fields)
      fields.each do |field|
        define_method(field) do |id:|
          self.send(field.to_s.pluralize).find(id)
        end
      end
    end

    def resources_custom_id(id,type,*fields)
      declare_resources_custom_id(id,type, *fields)
      define_resources_custom_id(id, *fields)
    end

    def declare_resources_custom_id(id,type, *fields)
      fields.each do |field|
        build_field(field,id,type)
      end
    end

    def define_resources_custom_id(custom_id,*fields)
      fields.each do |field|
        define_method(field) do |key:|
          self.send(field.to_s.pluralize).find_by(custom_id => key)
        end
      end
    end

    def build_field(field,id=:id,type=ID)
      field field, field_type(field), null: true do
        argument id, type, required: true
      end
    end


  end
end