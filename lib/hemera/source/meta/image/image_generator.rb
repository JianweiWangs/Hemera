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
      def initialize(output_file_name, path)
        @class_name = output_file_name
        @path = path
        @images = image_model_of_names
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
        lights = []
        darks = []
        names.each do |name|
          if name =~ /^night_(.*)/
            darks << name.gsub('night_', '')
          else
            lights << name
          end
        end
        lights.map do |name|
          field_name = name.gsub(/[\s.-]/, '_')
          light = name
          dark = darks.include?(name) ? 'night_' + name : name
          ImageModel.new(field_name, light, dark)
        end
      end

      def interface_file
        ERB.new(File.read(File.expand_path('template/image.h.erb', __dir__))).result(binding)
      end

      def implementent_file
        ERB.new(File.read(File.expand_path('template/image.m.erb', __dir__))).result(binding)
      end

      def generate # (is_swift)
        # if is_swift
        #   puts is_swift
        # else
        # end

        puts 'generating 😊'

        interface_file_path = @path + '/' + @class_name + '.h'
        implementent_file_path = @path + '/' + @class_name + '.m'

        File.open(interface_file_path, 'w') do |f|
          f.puts interface_file
        end

        File.open(implementent_file_path, 'w') do |f|
          f.puts implementent_file
        end

        puts 'generating done! 🎉'
      end
    end
  end
end



