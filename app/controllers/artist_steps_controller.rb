class ArtistStepsController < Wicked::WizardController
  steps :personal, :social

  def show
    @artist = current_user.artist
    render_wizard
  end

  def update
    @artist = current_user.artist
    @artist.attributes = params[:artist]
    render_wizard @artist
  end

private
  def finish_wizard_path
    artist_path(current_user.artist)
  end
end
