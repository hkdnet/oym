module Oym
  class Attribute
    attr_accessor :name
    attr_accessor :klass

    def initialize(name, klass)
      @name = name
      @klass = klass
    end

    def key
      "#{@name}="
    end

    def value_from(data)
      raw = data[name.to_s]
      return raw unless klass
      return klass.from_data(raw) if klass.respond_to?(:from_data)
      raise "#{klass} is specified as Oym::Attribute's klass, but #{klass} does not respond to from_data"
    end
  end
end
