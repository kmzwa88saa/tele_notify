require 'rest-client'

module TeleNotify
  class TelegramUser < ::ActiveRecord::Base

    validates_presence_of :telegram_id

    def self.configure_token(token)
      if token =~ /^[0-9]+:[\w-]+$/
        @token = token
        @url = "https://api.telegram.org/bot" + token + "/"
      else
        raise "Invalid token."
      end
    end

    def self.get_updates
      response = RestClient.get(@url + "getUpdates")
      if response["ok"]
        puts response
        puts response["result"]
        updates = response["result"]
        updates.each do |update|
          self.class.create( { telegram_user_id: update["message"]["from"]["id"], first_name: update["message"]["from"]["first_name"] } )
        end
      end
    end

    def self.send_message
      self.class.all.each do |user|
        RestClient.post(@url + "sendMessage", chat_id: user.telegram_user_id, text: "Test")
      end
    end

  end

end
