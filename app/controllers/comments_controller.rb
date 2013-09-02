class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @comments = Comment.all
  end

  def create
    @comment = if params[:artist_id]
      current_user.comments.create(params[:comment].merge(:artist_id => params[:artist_id]))
    else 
      current_user.comments.create(params[:comment].merge(:tattoo_id => params[:tattoo_id]))
    end
    redirect_to :back
  end

  def destroy
    if params[:tattoo_id]
      @tattoo = Tattoo.find(params[:tattoo_id])
  	  @comment = @tattoo.comments.find(params[:id])
      @comment.destroy
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @comment = @artist.comments.find(params[:id])
      @comment.destroy
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
