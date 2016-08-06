module Oym
  module Resource
    def attribute(name)
      attr_accessor name
      _attribute_names.push(name)
    end

    def _attribute_names
      @_attribute_names ||= []
    end

    def from_yaml(path)
      raise "No such file" unless File.exist?(path)
      require 'yaml'
      data = YAML.load_file(path)
      initial_resource do |e|
        _attribute_names.each do |key|
          e.send("#{key}=", data[key.to_s])
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
