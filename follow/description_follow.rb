# encoding:utf-8


require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end

followers_list = client.friends("")

=begin
followers_list.each do |x|
        p x.description
end
=end

number = 1 
catch(:out) do
        followers_list.each do |x| 
                followers_list_list = client.friends(x)
                followers_list_list.each do |i| 
                        description = i.description
                        if description =~ /琉大/ && !(description =~ /TOEIC/) then
                        client.follow(i)
                        number = number + 1 
                                if number == 100 then
                                        throw :out
                                end 
                        end 
                end 
        end 
end

