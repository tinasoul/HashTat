module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def like_button(tattoo, user)
    content_tag :div, id: dom_id(tattoo), class: 'like_button' do
      if user.voted_for?(tattoo)
        render partial: 'tattoos/liked', locals: {tattoo: tattoo}
      elsif !user.voted_for?(tattoo)
        render partial: 'tattoos/not_liked', locals: {tattoo: tattoo}
      else
        puts "hello"
      end
    end
  end

  def show_tattoo_photo(tattoo)
    if tattoo.twitter_photo.blank?
      link_to image_tag(tattoo.picture_url(:medium)), tattoo 
    else
      link_to image_tag(tattoo.twitter_photo), tattoo 
    end
  rescue
    link_to(tattoo) do
      image_tag 'hashlogo.png'
    end
  end

  def show_tattoo_photo_profile(tattoo)
    image_url = if(tattoo.twitter_photo.blank?)
      tattoo.picture_url(:medium)
    else
      tattoo.twitter_photo
    end

    style = "height: 250px; width: 250px; background-position: center; background-size: cover; background-image: url(#{ image_url });"

    link_to tattoo do
      content_tag(:div, {class: 'profile-photo', style: style}) do
        " "
      end
    end.html_safe
  end
  def current_step(path)
    "current_step" if current_page?(path)
  end

  def avatar_url(user)
    if user.avatar.present?
      user.avatar
    else
      default_url = "#{root_path}/assets/hashlogo.png"
      if user.email
        gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
        "http://gravatar.com/avatar/#{gravatar_id}.png"
      else
        default_url
      end
    end
  end

end
