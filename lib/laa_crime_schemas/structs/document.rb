# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Document < Base
      attribute :s3_object_key, Types::String
      attribute :filename, Types::String
      attribute :content_type, Types::String
      attribute :file_size, Types::Coercible::Integer

      # Virus scanning
      attribute :scan_status, Types::VirusScanStatus
      attribute? :scan_provider, Types::String
      attribute? :scan_output, Types::String
      attribute? :scan_at, Types::JSON::Date
    end
  end
end
