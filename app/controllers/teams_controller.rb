class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @teams = club.teams.all
    respond_with([club, @team])
  end

  def show
    respond_with([club, @team])
  end

  def new
    @team = club.teams.new
    respond_with([club, @team])
  end

  def edit
  end

  def create
    @team = club.teams.new(team_params)
    @team.save
    respond_with([club, @team])
  end

  def update
    @team.update(team_params)
    respond_with([club, @team])
  end

  def destroy
    @team.destroy
    respond_with([club, @team])
  end

  private
    def set_team
      @team = club.teams.find(params[:id])
    end

    def club
      @club ||= Club.where(id: params.require(:club_id)).first
    end

    def team_params
      params.require(:team).permit(:name, {children_attributes: [:first_name, :last_name]})
    end
end
