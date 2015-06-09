# encoding:utf-8


require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end

follower_list = client.followers("")

File.open("follower.txt","w") do |file|
        follower_list.each do |x| 
                file.write(x)
        end 
end

