class BoutsController < ApplicationController
  # GET /bouts
  # GET /bouts.xml
  def index
    @bouts = Bout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bouts }
    end
  end

  # GET /bouts/1
  # GET /bouts/1.xml
  def show
    @bout = Bout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bout }
    end
  end

  def select_wrestler
    @bout = Bout.new
    @teams = Team.all
    @wrestlers = Wrestler.all
    
    respond_to do |format|
      format.html { render :layout => "layouts/mobile" }
    end
  end
  
  #GET /bouts/match_setup
  def match_setup
    @bout = Bout.new
    @teams = Team.all
    @wrestlers = Wrestler.all
    @friendly_wrestler = Wrestler.find(params[:id], :include => :team)
    @opponent_wrestler = @bout.build_red_wrestler
    
    @wrestler_first_name = :green_first_name
    @wrestler_last_name = :green_last_name
    @wrestler_team_name = :green_team_name
    
    respond_to do |format|
      format.html { render :layout => "layouts/mobile" }
    end
  end
  
  def mobile_scorecard
    @bout = Bout.find(params[:id], :include => [:green_wrestler, :red_wrestler])
    
    respond_to do |format|
      format.html { render :layout => "layouts/mobile" }
    end
  end
  
  def end_match
    @bout = Bout.find(params[:id], :include => [:red_wrestler, :green_wrestler])

    respond_to do |format|
      format.html { render :layout => "layouts/mobile" }
    end
  end
  
  # GET /bouts/new
  # GET /bouts/new.xml
  # /bouts/new/1
  def new
    @bout = Bout.new
    
    @friendly_wrestler = @bout.build_green_wrestler
    @opponent_wrestler = @bout.build_red_wrestler
    @wrestler = Wrestler.new
    
    @teams = Team.all
    @wrestlers = Wrestler.all
    
    if params.has_key?(:id)
      @friendly_wrestler = Wrestler.find(params[:id], :include => :team)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bout }
    end
  end

  # GET /bouts/1/edit
  def edit
    @bout = Bout.find(params[:id])
  end

  # POST /bouts
  # POST /bouts.xml
  def create
    @bout = Bout.new(params[:bout])

    respond_to do |format|
      if @bout.save
        format.html { redirect_to(:action => :mobile_scorecard, :id => @bout.id) }
        format.xml  { render :xml => @bout, :status => :created, :location => @bout }
      else
        format.html { redirect_to match_setup_path(params[:red_id]) }
        format.xml  { render :xml => @bout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bouts/1
  # PUT /bouts/1.xml
  def update
    @bout = Bout.find(params[:id])

    respond_to do |format|
      if @bout.update_attributes(params[:bout])
        format.html { redirect_to(@bout, :notice => 'Bout was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bouts/1
  # DELETE /bouts/1.xml
  def destroy
    @bout = Bout.find(params[:id])
    @bout.destroy

    respond_to do |format|
      format.html { redirect_to(bouts_url) }
      format.xml  { head :ok }
    end
  end
  
  def swap_colors
    
  end
end
