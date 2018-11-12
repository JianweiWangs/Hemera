require 'erb'
require 'pathname'
module Hemera
  module Generator
    class ImageModel
      attr_reader :name
      attr_reader :name_light
      attr_reader :name_dark
      def initialize(name, name_light, name_dark)
        @name = name
        @name_light = name_light
        @name_dark = name_dark
      end

      def to_s
        @name + "\t" + @name_light + "\t" + @name_dark
      end
    end
    class ImageGenerator
      # attr_reader :output_file_name
      def initialize(output_file_name, path)
        @output_file_name = output_file_name
        @path = path
      end

      def find_paths_of_png(path = @path)
        Dir.glob(path + '/**/*.png')
      end

      def names_of_image_paths(paths = find_paths_of_png)
        paths.map do |path|
          path.split('/').last[0..-('.png'.length + 1)].split('@').first
        end
      end

      def image_model_of_names(names = names_of_image_paths)
        names.map do |name|
          ImageModel.new(name.sub('-', '_'), name, 'night_' + name)
        end
      end

      def generate # (is_swift)
        # if is_swift
        #   puts is_swift
        # else
        # end
        puts 'generating'
        image_model_of_names.each do |x|
          puts x
        end
      end
    end
  end
end



