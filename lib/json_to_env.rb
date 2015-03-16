require 'json'

class JsonToEnv
  VERSION = "0.2.0"

  def self.load(json)
    hash = JSON.parse json
    paths = hash.keys.map { |key| [key] }
    envs = {}

    while path = paths.shift
      value = hash
      path.each { |step| value = value[step] }

      if value.respond_to?(:keys)
        value.keys.each { |key| paths << path + [key] }
      else
        envs[path.join("_").upcase] = value
      end
    end

    envs.each { |k,v| ENV[k] = self.stringify(v) unless ENV.has_key? k }
  end

  def self.stringify(v)
    str_value = v
    str_value = JSON.dump(v) if v.is_a?(Array)
    str_value = JSON.dump(v) if v.is_a?(Hash)
    str_value.to_s
  end

  def self.load_file(file_path)
    if File.exist? file_path
      self.load File.read(file_path)
    end
  end
end
