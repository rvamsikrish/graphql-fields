module GraphqlFieldRegular
  module ClassMethods
    def optional_fields(*fields)
      fields.each do |field|
        if field.kind_of?(Array)
          field field[0], field[1], null: true
        else
          field field, String, null: true
        end
      end
    end

    def required_fields(*fields)
      fields.each do |field|
        if field.kind_of?(Array)
          field field[0], type_of(field[1]), null: false
        else
          field field, String, null: false
        end
      end
    end

    def type_of(type)
      case type
      when String, Int, Integer, Float, Boolean, ID
        return type
      when DateTime
        return GraphQL::Types::ISO8601DateTime
      when Date
        return GraphQL::Types::ISO8601Date
      when JSON
        GraphQL::Types::JSON
      when BigInt
        GraphQL::Types::BigInt
      else
        String
      end
    end
  end
end