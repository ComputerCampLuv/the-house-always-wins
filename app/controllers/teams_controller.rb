class TeamsController < ApplicationController
  def show
    @country = Country.find(params[:country_id])
    @league = @country.leagues.find(params[:league_id])
    @season = @league.seasons.find(params[:season_id])
    @team = @season.teams.find(params[:id])
    @games = @team.games.where(season: @season)
  end
end
