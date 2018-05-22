class DataDragon::Items
  def initialize
    @data = JSON.parse((Build.data_unpacked_path + Build.version_path.read + "data" + "en_AU" + "item.json").read)
  end
  
  def each
    
    @data["data"].each_pair do |item_id, item_data|
      
      
    
      instance = Models::Item.new({
        id: item_id
      })
      
      yield instance
    end
  end
end