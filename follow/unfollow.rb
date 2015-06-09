# encoding:utf-8


require 'twitter'


#configure
client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end


#フォローファイル.フォロワーファイルを読み込む
follow_file = File.read("follow.txt")
follower_file = File.read("follower.txt")

#unfollow
follower_file.each_line do |line|
        count = 0 

        follow_file.each_line do |u_line|
                if line =~ u_line then
                        break
                        count = 1 
                end 
        end 

        if count == 0 then
                client.unfollow(user_name)
        end 
end

