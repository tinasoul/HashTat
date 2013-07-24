class TattoosController < ApplicationController
  # GET /tattoos
  # GET /tattoos.json
  def index
    @tattoos = Tattoo.all
    @users = User.all
<<<<<<< HEAD
=======

>>>>>>> d492a082fd0c46bee48fad39733f0ed562375847
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tattoos }
    end
  end

  # GET /tattoos/1
  # GET /tattoos/1.json
  def show
    @tattoo = Tattoo.find(params[:id])
    @comment = @tattoo.comments.build
    @comments = Comment.all
    @users = User.all
    
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @tattoo }
    end
  end

  # GET /tattoos/new
  # GET /tattoos/new.json
  def new
    @tattoo = Tattoo.new
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tattoo }
    end
  end

  # GET /tattoos/1/edit
  def edit
    @tattoo = Tattoo.find(params[:id])
    @users = User.all
  end

  # POST /tattoos
  # POST /tattoos.json
  def create
    @tattoo = Tattoo.new(params[:tattoo])
    @users = User.all

    respond_to do |format|
      if @tattoo.save
        format.html { redirect_to @tattoo, notice: 'Tattoo was successfully created.' }
        format.json { render json: @tattoo, status: :created, location: @tattoo }
      else
        format.html { render action: "new" }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tattoos/1
  # PUT /tattoos/1.json
  def update
    @tattoo = Tattoo.find(params[:id])
    @users = User.all

    respond_to do |format|
      if @tattoo.update_attributes(params[:tattoo])
        format.html { redirect_to @tattoo, notice: 'Tattoo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tattoos/1
  # DELETE /tattoos/1.json
  def destroy
    @tattoo = Tattoo.find(params[:id])
    @users = User.all
    @tattoo.destroy

    respond_to do |format|
      format.html { redirect_to tattoos_url }
      format.json { head :no_content }
    end
  end
end
