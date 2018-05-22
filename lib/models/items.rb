class Models::Items < Models::List
  def self.load
    list = new
    JSON.parse(Build.items_path.read).each { |hash| list << Models::Item.new(hash) }
    list
  end

  def save
    Build.items_path.write(map(&:to_h).to_json)
  end
end