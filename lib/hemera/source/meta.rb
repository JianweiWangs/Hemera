require 'hemera/source/meta/image/image_generator'
module Hemera
  module Meta
    class << self
      def generate(file_name, path = '.')
        Hemera::Generator::ImageGenerator.new(file_name, path).generate
      end
    end
  end  
end