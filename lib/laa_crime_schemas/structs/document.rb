# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Document < Base
      attribute :s3_object_key, Types::String
      attribute :filename, Types::String
      attribute :content_type, Types::String
      attribute :file_size, Types::Coercible::Integer
    end
  end
end
