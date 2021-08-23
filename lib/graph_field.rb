# frozen_string_literal: true

require_relative "graph_field/version"
require_relative "graph_field/graphql_field_collection"
require_relative "graph_field/graphql_field_resource"
require_relative "graph_field/graphql_field_regular"
require_relative "graph_field//graphql_field_association"

module GraphField
  class Error < StandardError; end
  module ClassMethods
    include GraphqlFieldAssociation::ClassMethods
    include GraphqlFieldRegular::ClassMethods
  end
end
