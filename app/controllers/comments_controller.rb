class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.create(params[:comment].merge(:tattoo_id => params[:tattoo_id]))
    redirect_to :back
  end

end
