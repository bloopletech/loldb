class Seeder
  def initialize
  end
  
  def seed
    Build.models_path.mkpath

    items = Models::Items.new
    DataDragon::Items.new.each { |item| items << item }
    items.save
  end
end
    