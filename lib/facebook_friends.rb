require "facebook_friends/version"
require 'net/http'

module FacebookFriends
  class Arvind
    # Your code goes here...
    def self.count(token)
        response = Net::HTTP.get_response(URI("https://graph.facebook.com/v2.5/me/friends?access_token=#{token}&fields=about,email,gender,first_name,name,picture"))
        unless response.is_a?(Net::HTTPSuccess)
          return nil
        end
        json = ActiveSupport::JSON.decode(response.body)
        return json
    end

    def self.friends(token)
        response = Net::HTTP.get_response(URI("https://graph.facebook.com/v2.5/me/friends?access_token=#{token}&fields=about,email,gender,first_name,name,picture"))
        json = ActiveSupport::JSON.decode(response.body)

        # unless response.is_a?(Net::HTTPSuccess)
        #   return nil
        # end
        return json
    end

    def self.user(token)
        response = Net::HTTP.get_response(URI("https://graph.facebook.com/v2.5/me/?access_token=#{token}&fields=about,email,gender,first_name,name,picture"))
        unless response.is_a?(Net::HTTPSuccess)
          return nil
        end
        json = ActiveSupport::JSON.decode(response.body)
        return json
    end

    def self.feed(token)
        response = Net::HTTP.get_response(URI("https://graph.facebook.com/v2.5/me/feed?access_token=#{token}&fields=caption,description,icon,link,message,picture,admin_creator,name,source"))
        unless response.is_a?(Net::HTTPSuccess)
          return nil
        end
        json = ActiveSupport::JSON.decode(response.body)
        return json
    end

  end
end
