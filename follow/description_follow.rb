# encoding:utf-8


require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end

followers_list = client.friends("")

number = 1 
#followできるかを判断するメソッド
def can_follow?(match,out,client,description)
        return description =~ /match/ && !(description =~ /out/) && client.follow_request_sent? == false 
end



catch(:out) do
        followers_list.each do |x| 
                followers_list_list = client.friends(x)
                followers_list_list.each do |i| 
                        description = i.description
                        if can_follow?("琉球大学","TOEIC",i,description) then
                        client.follow(i)
                        number = number + 1 
                                if number == 100 then
                                        throw :out
                                end 
                        end 
                end 
        end 
end

