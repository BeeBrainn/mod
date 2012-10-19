class UnpsController < ApplicationController
  # GET /unps
  # GET /unps.json
  def index
    @unps = Unp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unps }
    end
  end

  # GET /unps/1
  # GET /unps/1.json
  def show
    @unp = Unp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unp }
    end
  end

  # GET /unps/new
  # GET /unps/new.json
  def new
    @unp = Unp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unp }
    end
  end

  # GET /unps/1/edit
  def edit
    @unp = Unp.find(params[:id])
  end

  # POST /unps
  # POST /unps.json
  def create
    @unp = Unp.new(params[:unp])

    respond_to do |format|
      if @unp.save
        format.html { redirect_to @unp, notice: 'Unp was successfully created.' }
        format.json { render json: @unp, status: :created, location: @unp }
      else
        format.html { render action: "new" }
        format.json { render json: @unp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unps/1
  # PUT /unps/1.json
  def update
    @unp = Unp.find(params[:id])

    respond_to do |format|
      if @unp.update_attributes(params[:unp])
        format.html { redirect_to @unp, notice: 'Unp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unps/1
  # DELETE /unps/1.json
  def destroy
    @unp = Unp.find(params[:id])
    @unp.destroy

    respond_to do |format|
      format.html { redirect_to unps_url }
      format.json { head :no_content }
    end
  end
end
