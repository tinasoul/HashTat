desc "Gets tweets with #hashtat referenced."
task :twitter => :environment do 
  Tweet.pull_tweets
end
