desc "Gets tweets with #hashtat referenced."
task :twitter => :environment do 
  while true do
  puts "About to pull tweets..."
  Tweet.pull_tweets
  sleep 6
  puts "Finished"
  end
end
