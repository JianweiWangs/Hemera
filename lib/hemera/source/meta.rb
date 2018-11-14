require 'hemera/source/meta/image/image_generator'
module Hemera
  module Meta
    class << self
      def generate(file_name, is_swift, path = '.')
        Hemera::Generator::ImageGenerator.new(file_name, path).generate is_swift
      end
    end
  end  
end