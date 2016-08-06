module Oym
  module Errors
    class BaseError < StandardError
    end

    class FileMissingError < BaseError
      def initialize(path)
        @path = path
      end

      def message
        "No such file: #{@path}"
      end
    end
  end
end
