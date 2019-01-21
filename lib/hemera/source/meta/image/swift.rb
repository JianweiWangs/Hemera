require 'erb'
module Hemera
  module Generator
    class SwiftImageGenerator
      def initialize(struct_name, images, bundle_name)
        @struct_name = struct_name
        @images = images
        @bundle_name = bundle_name
      end

      def swift_file
        ERB.new(File.read(File.expand_path('template/image_swift.erb', __dir__))).result(binding)
      end
    end
  end
end