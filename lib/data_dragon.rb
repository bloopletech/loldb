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

  def self.item_path
    data_unpacked_path + version_path.read + "data" + "en_AU" + "item.json"
  end

  def self.item_image_path(id)
    data_unpacked_path + version_path.read + "img" + "item" + "#{id}.png"
  end
end