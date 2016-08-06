module Oym
  module Resource
    def attribute(name, klass: nil, array: false)
      attr_accessor name
      oym_attributes.push(Oym::Attribute.new(name, klass, array))
    end

    def oym_attributes
      @oym_attributes ||= []
    end

    def from_yaml(path)
      raise Oym::Errors::FileMissingError, path unless File.exist?(path)
      require 'yaml'
      from_data(YAML.load_file(path))
    end

    def from_data(data)
      initial_resource do |e|
        oym_attributes.each do |attr|
          e.send(attr.key, attr.value_from(data))
        end
      end
    end

    def initial_resource
      ret = new
      yield ret
      ret
    end
  end
end
