require 'erb'
module Hemera
  module Generator
    class ObjCImageGenerator
      def initialize(class_name, images, bundle_name)
        @class_name = class_name
        @images = images
        @bundle_name = bundle_name
      end

      def interface_file
        ERB.new(File.read(File.expand_path('template/image.h.erb', __dir__))).result(binding)
      end

      def implementent_file
        ERB.new(File.read(File.expand_path('template/image.m.erb', __dir__))).result(binding)
      end
    end
  end
end
