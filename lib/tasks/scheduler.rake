desc "This task is called by the Heroku scheduler add-on"
task :grab_twitts => :environment do
  puts "Grabing all tweets for keyword..."
  Keyword.grab_all_tweets
  puts "done."
end