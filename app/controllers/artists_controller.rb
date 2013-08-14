class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @comment = @artist.comments.build
    @comments = @artist.comments
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  # Creates the artist through the user model
  def create
    @artist = current_user.build_artist(params[:artist])
    if @artist.save
      redirect_to artist_steps_path
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def favorite
  end

  def unfavorite
  end
end
