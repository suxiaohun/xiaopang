class XiaopangEnv
  class << self
    attr_accessor :property

    def load_config_env
      path = '../property.yml'
      _hash = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path(path, __FILE__)))).deep_symbolize_keys
      RecursiveOpenStruct.new(_hash)
    end

    def method_missing(method_name, *args, &block)
      @property ||= load_config_env

      result = @property[method_name]
      if result
        result
      else
        super
      end
    end

  end
end