class TattoosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  layout "full-width", :only => [:index, :search]
  # GET /tattoos
  # GET /tattoos.json
  def index
    @tattoos = Tattoo.order('created_at DESC').all
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
    @comments = @tattoo.comments
    @user = @tattoo.user_id
    @current_url = request.original_url
    
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @tattoo }
    end
  end

  # GET /tattoos/new
  # GET /tattoos/new.json
  def new
    @tattoo = Tattoo.new

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
    @tattoo = current_user.tattoos.build(params[:tattoo])
    

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
    @tattoo.destroy

    respond_to do |format|
      format.html { redirect_to tattoos_url }
      format.json { head :no_content }
    end
  end

  def vote_up
      @tattoo = Tattoo.find(params[:id])
    current_user.vote_for(@tattoo)
    respond_to do |format|
      format.js {render 'vote'}
      format.html{redirect_to :back}
    end
  end

  def vote_down
    @tattoo = Tattoo.find(params[:id])
    current_user.unvote_for(@tattoo)
    respond_to do |format|
      format.js {render 'vote'}
      format.html{redirect_to :back}
    end
  end

   def search
    # copying code here so this means this code should be at higher level like on index action
    params[:per_page] ||= 25
    params[:page]     ||= 1

    @search = Tattoo.search(params[:q], params)
    @tattoos = @search.results

    # .page(params[:page]).per_page(params[:per_page])

    render "index"
  end  



  #   begin
  #     current_user.vote_for(@tattoo = Tattoo.find(params[:id]))
  #     render :nothing => true, :status => 200
  #   rescue ActiveRecord::RecordInvalid
  #     render :nothing => true, :status => 404
  #   end
  # end

end
