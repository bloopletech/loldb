class DataDragon::Items
  def initialize
    @data = JSON.parse(DataDragon.item_path.read)
  end
  
  def each
    basic = @data["basic"]

    @data["data"].each_pair do |id, attrs|
      attrs = basic.deep_merge(attrs)

      next if attrs["hideFromAll"]

      yield Models::Item.new(build_item(id, attrs))
    end
  end

  def build_item(id, attrs)

    {
      id: id,
      name: attrs["name"],
      description: attrs["description"],
      image_path: DataDragon.item_image_path(id)
    }
    
  end
end