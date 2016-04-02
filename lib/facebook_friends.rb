require "facebook_friends/version"
require 'net/http'

module FacebookFriends
  class Arvind
    # Your code goes here...
    def self.count(token)
      # TODO: process `str`
        response = Net::HTTP.get_response(URI("https://graph.facebook.com/v2.5/me/friends?access_token=#{token}"))
        unless response.is_a?(Net::HTTPSuccess)
          return nil
        end
        json = ActiveSupport::JSON.decode(response.body)
        return json
    end
  end
end
