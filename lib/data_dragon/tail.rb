class DataDragon::Tail
  def initialize
    @version = DataDragon.version_path.read
    raise unless @version && @version != ""
  end

  def tail_path
    DataDragon.data_unpacked_path + @version
  end

  def item_path
    tail_path + "data" + "en_AU" + "item.json"
  end

  def item_image_path(id)
    tail_path + "img" + "item" + "#{id}.png"
  end
end