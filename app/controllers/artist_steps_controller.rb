class ArtistStepsController < Wicked::WizardController
  steps :personal, :social, :page_style

  def show
    @step = step
    @artist = current_user.artist
    render_wizard
    puts "STEP: #{@step}"
  end

  def update
    @step = step
    @artist = current_user.artist
    @artist.attributes = params[:artist]
    render_wizard @artist
    puts "STEP: #{@step}"
  end

private

  def finish_wizard_path
    @artist = current_user.artist
    if @artist.vanity_url.empty?
      artist_path(current_user.artist.id)
    else
      artist_path(current_user.artist.vanity_url)
    end
  end
  
end
