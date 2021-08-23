module GraphqlFieldInformation
  module ClassMethods
    def field_type(name)
      type = field_class_name(name).concat('Type')
      "#{namespace}::#{type}"
    end

    def field_class_name(name)
      name.to_s.camelize.singularize
    end

    def namespace
      self.name.split("::")[0..-2].join("::")
    end
  end
end