module TeleNotify
  class TelegramController < ApplicationController
    def webhook
      puts params[:message]
      TelegramUser.create( { telegram_id: params[:message][:from][:id], first_name: params[:message][:from][:first_name] } )
    end
  end
end
