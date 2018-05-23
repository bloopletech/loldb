class Seeder
  def initialize
  end
  
  def seed
    Build.models_path.mkpath
    tail = DataDragon::Tail.new

    items = Models::Items.new
    DataDragon::Items.new(tail).each { |item| items << item }
    items.save
  end
end
    