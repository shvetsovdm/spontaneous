# encoding: UTF-8

require 'miso'

module Spontaneous
  module FieldTypes

    module ImageFieldUtilities
      attr_accessor :template_params

      def to_html(attr={})
        default_attr = {
          :src => src,
          :width => width,
          :height => height,
          :alt => ""
        }
        default_attr.delete(:width) if width.nil?
        default_attr.delete(:height) if height.nil?
        if template_params && template_params.length > 0 && template_params[0].is_a?(Hash)
          attr = template_params[0].merge(attr)
        end
        if attr.key?(:width) || attr.key?(:height)
          default_attr.delete(:width)
          default_attr.delete(:height)
          if (attr.key?(:width) && !attr[:width]) || (attr.key?(:height) && !attr[:height])
            attr.delete(:width)
            attr.delete(:height)
          end
        end
        attr = default_attr.merge(attr)
        params = []
        attr.each do |name, value|
          params << %(#{name}="#{value.to_s.escape_html}")
        end
        %(<img #{params.join(' ')} />)
      end

      def to_s
        src
      end
    end

    class ImageField < Base
      include ImageFieldUtilities

      def self.accepts
        %w{image/(png|jpeg|gif)}
      end

      def self.sizes(sizes=nil)
        if sizes
          @size_definitions = validate_sizes(sizes)
        else
          size_definitions
        end
      end

      def self.validate_sizes(sizes)
        sizes
      end

      def self.size_definitions
        @size_definitions ||= {}
      end

      def has_attribute?(attribute_name)
        super || self.class.size_definitions.key?(attribute_name)
      end

      def attribute_get(attribute, *args)
        @sizes ||= Hash.new { |hash, key| hash[key] = ImageAttributes.new(attributes[key]) }
        @sizes[attribute].tap do |size|
          size.template_params = args
        end
      end

      # original is special and should always be defined
      def original
        @original ||= (attributes.key?(:original) ? attribute_get(:original) : ImageAttributes.new(:src => value))
      end

      def width
        original.width
      end

      def height
        original.height
      end

      def filesize
        original.filesize
      end

      def src
        original.src
      end


      def filepath
        unprocessed_value
      end

      def process(image_path)
        filename = nil
        case image_path
        when Hash
          filename = image_path[:filename]
          image_path = image_path[:tempfile].path
        when String
          attributes.clear
          return image_path unless File.exist?(image_path)
        else
        end
        image_path = owner.make_media_file(image_path, filename)
        image = ImageProcessor.new(image_path)
        attribute_set(:original, image.serialize)
        self.class.size_definitions.each do |name, size|
          attribute_set(name, image.resize(name, size).serialize)
        end
        set_unprocessed_value(File.expand_path(image_path))
        image.src
      end
    end

    ImageField.register

    class ImageAttributes
      include ImageFieldUtilities
      attr_reader  :src, :width, :height, :filesize

      def initialize(params={})
        params ||= {}
        @src, @width, @height, @filesize = params[:src], params[:width], params[:height], params[:filesize]
      end
      def serialize
        {
          :src => src,
          :width => width,
          :height => height,
          :filesize => filesize
        }
      end
    end

    class ImageProcessor
      MAX_DIM = 2 ** ([42].pack('i').size * 8) - 1 unless defined?(MAX_DIM)
      include ImageFieldUtilities

      attr_reader :path

      def initialize(path)
        @path = File.expand_path(path)
      end

      def src
        @src ||= \
          begin
            media_dir = Spontaneous.media_dir
            src = path.sub(%r{^#{media_dir}}, '')
            File.join("/#{File.basename(media_dir)}", src)
          end
      end

      def filesize
        File.size(path)
      end

      def width
        dimensions[0]
      end

      def height
        dimensions[1]
      end

      def dimensions
        @dimensions ||= Spontaneous::ImageSize.read(path)
      end

      def resize(name, size)
        image = Miso::Image.new(path)
        [:crop, :fit].each do |method|
          if size.key?(method)
            image.send(method, *size[method])
          end
        end
        if size.key?(:width)
          image.send(:fit, size[:width], MAX_DIM)
        end
        if size.key?(:height)
          image.send(:fit, MAX_DIM, size[:height])
        end
        file_path = filename_for_size(name)
        image.write(file_path)

        ImageProcessor.new(file_path)
      end

      def filename_for_size(name)
        directory = File.dirname(path)
        original_filename = File.basename(path)
        parts = original_filename.split('.')
        ext = parts[-1]
        base = parts[0..-2].join('.')
        filename = [base, name, ext].join('.')
        File.join(directory, filename)
      end

      def serialize
        {
          :src => src,
          :width => width,
          :height => height,
          :filesize => filesize
        }
      end
    end

  end
end

