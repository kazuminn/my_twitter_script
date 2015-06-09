require 'twitter'
                               
        client = Twitter::REST::Client.new do |config|
            config.consumer_key = ""
            config.consumer_secret = ""
            config.access_token = ""
            config.access_token_secret = ""
        end
  
        hash = {}              
        client.user_timeline("warugaki_kazumi").compact.each do |x|
                        unless hash.has_key?(x.in_reply_to_screen_name) then
                                hash[x.in_reply_to_screen_name] = 1
                        else   
                                hash[x.in_reply_to_screen_name] = 2
                        end    
        end                    
      
        hash.each do |key,value|        
                if value.to_i == 1              
                        client.update("@warugaki_kazumiは、" + key + "さんにクソリプをしている可能性があります。")
                end            
        end       
