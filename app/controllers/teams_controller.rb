class TeamsController < ApplicationController
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to teams_url
    else
      render :action => :new
    end
  end
  
  def index
    @teams = Team.all
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to teams_url
    else
      render :action => :edit
    end
      
  end
end
