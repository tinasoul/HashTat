module ArtistHelper
  # Public: Determine if the user has entered a social handle
  #
  # artist - The current pages' artist id
  # social_network - The :symbol of the social network
  # &block - indicates that the method will be followed by a block
  #
  # Returns true if social handle exists and prints block
  def if_social(artist, social_network, &block)
    if !artist[social_network].empty?
      content_tag(:span, capture(&block))
    end 
  end

  # Public: Takes a user's input from social fields and parses it to see whether it starts with http://
  # This method is called from within build_link.
  #
  # url - A url supplied by the user
  #
  # Returns a full link with in http:// scheme
  def add_http(url)
    u=URI.parse(url)
    if (!u.scheme)
        return link = "http://" + url
    else
        return link = url
    end
  end

  # Builds a functional link from whatever input a user makes (as long as they enter a valid url or username)
  def build_link(artist, social_network)
    if artist[social_network].include?('/')
      link = add_http(artist[social_network])
    else
      link = "http://www." + social_network.to_s + ".com/#{artist[social_network]}"
    end
    link_to image_tag("#{social_network}-4-48.png"), link
  end
end
