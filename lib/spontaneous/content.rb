
require File.expand_path("../../sequel/plugins/yajl_serialization", __FILE__)

module Spontaneous
  class Content < Sequel::Model(:content)
    class << self
      alias_method :sequel_plugin, :plugin
    end

    sequel_plugin :yajl_serialization, :field_store
    sequel_plugin :single_table_inheritance, :type_id

    class << self
      alias_method :class_name, :name

      def class_name_with_fallback
        n = name
        if n.nil? or n.empty?
          n = "ContentClass#{object_id}"
        end
        n
      end

      def title(custom_title=nil)
        self.title = custom_title if custom_title
        @title or default_title
      end

      def default_title
        n = class_name_with_fallback.split(/::/).last.gsub(/([A-Z]+)([A-Z][a-z])/,'\1 \2')
        n.gsub!(/([a-z\d])([A-Z])/,'\1 \2')
        n
      end

      def title=(title)
        @title = title
      end

      def field(name, type=:string, options={}, &block)
        if type.is_a?(Hash)
          options = type
          type = :string
        end

        local_field_order << name
        field_prototypes[name] = FieldPrototype.new(name, type, options, &block)
        unless method_defined?(name)
          define_method(name) { fields[name] }
        else
          raise "Must give warning when field name clashes with method name"
        end

        setter = "#{name}=".to_sym
        unless method_defined?(setter)
          define_method(setter) { |value| fields[name].value = value  }
        else
          raise "Must give warning when field name clashes with method name"
        end
      end

      def field_prototypes
        @field_prototypes ||= {}
      end

      def field_names
        if @field_order && @field_order.length > 0
          remaining = default_field_order.reject { |n| @field_order.include?(n) }
          @field_order + remaining
        else
          default_field_order
        end
      end

      def default_field_order
        (supertype ? supertype.field_names : []) + local_field_order
      end

      def field_order(*new_order)
        @field_order = new_order
      end

      def local_field_order
        @local_field_order ||= []
      end

      def subclasses
        @subclasses ||= []
      end

      # supertype is like superclass but stops at the last instance of a Content class
      def supertype=(supertype)
        @supertype = supertype
      end

      def supertype
        @supertype
      end

      def descendents
        subclasses.map{ |x| [x] + x.descendents}.flatten
      end

      def inherited(subclass)
        super
        subclasses << subclass
        subclass.supertype = self
      end
    end

    def meta
      @_meta ||= \
        class << self; self; end
    end

    def field_prototypes
      self.class.field_prototypes
    end

    def fields
      @field_set ||= FieldSet.new(self, field_store)
    end

    def field_modified!(modified_field)
      self.field_store = @field_set.serialize
    end
  end
end
