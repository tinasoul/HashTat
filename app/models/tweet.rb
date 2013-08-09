class Tweet < ActiveRecord::Base
  attr_accessible :text, :pulled_tweet_id, :attached_photos, :handle
  # :pulled_twitter_hashtag
  
  has_many :tattoos
  serialize :attached_photos

  def self.pull_tweets
    # hashtags = []
    Twitter.search("#hashtat").results.map do |tweet|
     create!(pulled_tweet_id: tweet.id.to_s,
      text: tweet.text,
      attached_photos: tweet.media,
      handle: tweet.user.screen_name)
      # pulled_twitter_hashtag: tweet.text.hashtag

      # tweet.text.each do |word|
      #   hash_word = word.gsub(/[@#]\S+/,'')
      #   hashtags << hash_word
      # end
      # puts hashtags

      if User.find_by_username(tweet.user.screen_name)
        u = User.find_by_username(tweet.user.screen_name) 

        tweet.media.each do |photo| 
          @tattoo = u.tattoos.create(description: tweet.text, twitter_photo: photo.media_url)
        end
      end
      else 
        tweet.media.each do |photo| 
          @tattoo = tattoos.save(description: tweet.text, twitter_photo: photo.media_url)
    end
  end
end


#  def self.pull_tweets
#     Twitter.search("#hashtat").results.map do |tweet|
#      create!(pulled_tweet_id: tweet.id.to_s,
#       text: tweet.text,
#       attached_photos: tweet.media,
#       handle: tweet.user.screen_name)
#       # pulled_twitter_hashtag: tweet.text.hashtag

#       if User.find_by_username(tweet.user.screen_name)
#         u = User.find_by_username(tweet.user.screen_name)

#         tweet.media.each do |photo|
#           uploader = PictureUploader.new
#           File.write("public/tattoos/#{photo.id}.jpg", open(photo.media_url).read, {mode: 'wb'})
#           uploader.store!(File.open("public/tattoos/#{photo.id}.jpg"))
#           @tattoo = u.tattoos.create(description: tweet.text, picture: photo)
#        else
#         tweet.media.each do |photo|
#           uploader = PictureUploader.new
#           File.write("public/tattoos/#{photo.id}.jpg", open(photo.media_url).read, {mode: 'wb'})
#           uploader.store!(File.open("public/tattoos/#{photo.id}.jpg"))
#         end
#       end
#     end
#   end
# end





