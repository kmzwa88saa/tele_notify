require 'rest-client'

module TeleNotify
  class TelegramUser < ::ActiveRecord::Base

    validates_presence_of :telegram_id
    validates_uniqueness_of :telegram_id

    @@next_update_id = 0

    def self.configure_token(token)
      if token =~ /^[0-9]+:[\w-]+$/ #hacker proof
        @@token = token
        @@url = "https://api.telegram.org/bot" + token + "/"
      else
        raise "Invalid token."
      end
    end

    def self.get_updates
      puts @@next_update_id
      response = JSON.parse(RestClient.post(@@url + "getUpdates", { offset: @@next_update_id }), { symbolize_names: true })
      puts response
      if response[:ok]
        updates = response[:result]
        updates.each do |update|
          self.create( { telegram_id: update[:message][:from][:id], first_name: update[:message][:from][:first_name] } )
          @@next_update_id = update[:update_id] + 1
        end
      end
    end

    def self.send_message_to_all(text)
      success = true
      TeleNotify::TelegramUser.all.each do |user|
        success = false if !user.send_message(text)
      end
      success
    end


    def send_message(text)
      response = JSON.parse(RestClient.post(@@url + "sendMessage", chat_id: self.telegram_id, text: text), { symbolize_names: true })
      response[:ok]
    end


  end

end
