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

  def self.data_unpacked_path
    data_path + 'unpacked'
  end

  def self.version_path
    data_path + "version"
  end

  def self.data_pack_path
    data_path + "pack.tgz"
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