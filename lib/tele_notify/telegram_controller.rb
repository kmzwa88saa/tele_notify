module TeleNotify
  class TelegramController < ApplicationController
    def webhook
      puts params[:message]
      TelegramUser.create( { telegram_id: update[:message][:from][:id], first_name: update[:message][:from][:first_name] } )
    end
  end
end
