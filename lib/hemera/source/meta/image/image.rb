
module Hemera
  module Generator
    class ImageGenerator
      # attr_reader :output_file_name
      
      def initialize(output_file_name, path)
        @output_file_name = output_file_name
        @path = path
      end

      def generate(is_swift)
        if is_swift
          puts is_swift
        else
          
        end
      end
    end
  end
end



