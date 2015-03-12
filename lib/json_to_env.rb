class JsonToEnv
  VERSION = "0.1.0"

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

    envs.each { |k,v| ENV[k] = v unless ENV.has_key? k }
  end

  def self.load_file(file_path)
    if File.exist? file_path
      self.load File.read(file_path)
    end
  end
end
