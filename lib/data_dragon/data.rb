class DataDragon::Data
  def self.seed
    seed_items
    
    #...
  end
  
  def self.seed_items
    item_data = (Build.data_unpacked_path + Build.version_path.read + "en_AU" + "item.json").read
    
  end
end
  
  