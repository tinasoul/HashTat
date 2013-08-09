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
end
