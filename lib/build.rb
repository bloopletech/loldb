module Build
  def self.root_path
    Pathname.new(__FILE__).dirname.parent
  end

  def self.data_path
    if ENV.key?('LOLDB_DATA_DIR')
      Pathname.new(ENV['LOLDB_DATA_DIR'])
    else
      root_path + 'data'
    end
  end

  def self.models_path
    data_path + 'models'
  end

  def self.items_path
    models_path + "items.json"
  end

  def self.build_path
    root_path + 'build'
  end

  def self.icons_path
    build_path + 'icons'
  end

  def self.output_path
    if ENV.key?('LOLDB_OUTPUT_DIR')
      Pathname.new(ENV['LOLDB_OUTPUT_DIR'])
    else
      root_path + 'output'
    end
  end
end