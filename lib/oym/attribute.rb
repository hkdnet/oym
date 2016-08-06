module Oym
  class Attribute
    attr_accessor :name
    attr_accessor :klass
    attr_accessor :array

    def initialize(name, klass, array)
      @name = name
      @klass = klass
      @array = array
    end

    def key
      "#{@name}="
    end

    def value_from(data)
      raw = data[name.to_s]
      return raw unless klass
      unless klass.respond_to?(:from_data)
        raise "#{klass} is specified as Oym::Attribute's klass, but #{klass} does not respond to from_data"
      end
      array ? raw.map { |e| klass.from_data(e) } : klass.from_data(raw)
    end
  end
end
