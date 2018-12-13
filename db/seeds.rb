require 'date'
require 'csv'

game_csv = "game_details.csv"
season_csv = "season_details.csv"

season = nil

CSV.foreach(season_csv, headers: false) do |row|

  if Country.find_by_name(row[0])
    country = Country.find_by_name(row[0])
  else
    country = Country.create(name: row[0])
  end

  if League.find_by_name(row[1])
    league = League.find_by_name(row[1])
  else
    league = League.create(name: row[1], country: country)
  end

  if Season.where(league: league).where(start_year: row[2].to_i).any?
    season = Season.where(league: league).where(start_year: row[2].to_i).first
  else
    season = Season.create(start_year: row[2].to_i, end_year: row[3].to_i, league: league)
  end

end

teams = []

CSV.foreach(game_csv, headers: true) do |row|
  teams << row[0]
end

teams.uniq!

teams.each do |team| 

  t = Team.find_by_name(team)

  if !t
    Team.create(name: team)
  end
  
  t.seasons << season
end

CSV.foreach(game_csv, headers: true) do |row|
  Game.create(
      home_team: Team.find_by_name(row[0]),
      away_team: Team.find_by_name(row[1]),
      home_team_goals: row[2].to_i,
      away_team_goals: row[3].to_i,
      match_date: DateTime.parse(row[4]),
      season: season)
end