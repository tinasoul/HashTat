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
  end

  def destroy
  end

  def favorite
  end

  def unfavorite
  end
end
