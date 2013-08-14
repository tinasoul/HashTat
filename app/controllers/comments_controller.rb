class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = if params[:artist_id]
      current_user.comments.create(params[:comment].merge(:artist_id => params[:artist_id]))
    else 
      current_user.comments.create(params[:comment].merge(:tattoo_id => params[:tattoo_id]))
    end
    redirect_to :back
  end

end
