module DataDragon
  def self.data_unpacked_path
    Build.data_path + 'unpacked'
  end

  def self.version_path
    Build.data_path + "version"
  end

  def self.data_pack_path
    Build.data_path + "pack.tgz"
  end
end