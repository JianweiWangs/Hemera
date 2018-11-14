require 'erb'
module Hemera
  module Generator
    class SwiftImageGenerator
      def initialize(struct_name, images)
        @struct_name = struct_name
        @images = images
      end

      def swift_file
        ERB.new(File.read(File.expand_path('template/image_swift.erb', __dir__))).result(binding)
      end
    end
  end
end