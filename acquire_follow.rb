# encoding:utf-8


require 'twitter'
require 'pp'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end

follow_list = client.friends("")

pp follow_list
=begin
File.open("follow.txt","w") do |file|
        follow_list.each do |x|
                file.write(x)
        end
end
=end
