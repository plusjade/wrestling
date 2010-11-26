class WrestlersController < ApplicationController
  # GET /wrestlers
  # GET /wrestlers.xml
  def index
    @wrestler = Wrestler.new
    @wrestlers = Wrestler.all
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wrestlers }
    end
  end

  # GET /wrestlers/1
  # GET /wrestlers/1.xml
  def show
    @wrestler = Wrestler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wrestler }
    end
  end

  # GET /wrestlers/new
  # GET /wrestlers/new.xml
  def new
    @wrestler = Wrestler.new
    @teams = Team.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wrestler }
    end
  end

  # GET /wrestlers/1/edit
  def edit
    @wrestler = Wrestler.find(params[:id])
    @teams = Team.all
  end
  
  # POST /wrestlers
  # POST /wrestlers.xml
  def create
    @wrestler = Wrestler.new(params[:wrestler])

    respond_to do |format|
      if @wrestler.save
        flash[:notice] = 'Wrestler was successfully created.'
        format.html { redirect_to(@wrestler) }
        format.xml  { render :xml => @wrestler, :status => :created, :location => @wrestler }
        format.js
      else
        flash[:notice] = "Error creating wrestler."
        format.html { redirect_to (new_wrestler_path) }
        format.xml  { render :xml => @wrestler.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /wrestlers/1
  # PUT /wrestlers/1.xml
  def update
    @wrestler = Wrestler.find(params[:id])

    respond_to do |format|
      if @wrestler.update_attributes(params[:wrestler])
        format.html { redirect_to(@wrestler, :notice => 'Wrestler was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wrestler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wrestlers/1
  # DELETE /wrestlers/1.xml
  def destroy
    @wrestler = Wrestler.find(params[:id])
    @wrestler.destroy

    respond_to do |format|
      format.html { redirect_to(wrestlers_url) }
      format.xml  { head :ok }
    end
  end
end
