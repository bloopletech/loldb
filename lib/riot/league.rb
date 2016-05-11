class Riot::League
  def initialize(league_id)
    @league_id = league_id
  end

  def data
    @data ||= Riot::ApiClient.matches(@league_id)
  end

  def teams
    data['teams']
  end

  def tournaments
    data['highlanderTournaments']
  end

  def published_tournaments
    tournaments.select { |t| t['published'] }
  end

  def schedule_items(tournament_id = nil)
    if tournament_id
      data['scheduleItems'].select { |s| s['tournament'] == tournament_id }
    else
      data['scheduleItems']
    end
  end
end
