class Models::Source
  attr_accessor :matches, :vods, :leagues, :teams, :players

  def self.from_h(hash)
    source = new
    hash['matches'].each { |hash| source.matches << Models::Match.new(hash) }
    hash['vods'].each { |hash| source.vods << Models::Vod.new(hash) }
    hash['leagues'].each { |hash| source.leagues << Models::League.new(hash) }
    hash['teams'].each { |hash| source.teams << Models::Team.new(hash) }
    hash['players'].each { |hash| source.players << Models::Player.new(hash) }
    source
  end

  def initialize
    @matches = initialize_list([])
    @vods = initialize_list([])
    @leagues = initialize_list([])
    @teams = initialize_list([])
    @players = initialize_list([])
  end

  def list_for(record)
    send("#{record.class.name.split('::').last.downcase}s")
  end

  def to_h
    {
      matches: @matches.map(&:to_h),
      vods: @vods.map(&:to_h),
      leagues: @leagues.map(&:to_h),
      teams: @teams.map(&:to_h),
      players: @players.map(&:to_h)
    }
  end

  private
  def initialize_list(list)
    Models::List.new(self, list)
  end
end

