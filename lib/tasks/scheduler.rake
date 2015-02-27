desc "This task is called by the Heroku scheduler add-on"
task :grab_twitts => :environment do
  puts "Grabing all tweets for keyword..."
  Keyword.grab_all_tweets
  puts "done."
  puts "Remove older than two days ..."
  Tweet.delete_older_than_x_days(2)
  puts "done."
  puts "Removing all duplicates..."
  Tweet.remove_duplicates
  puts "done."
end