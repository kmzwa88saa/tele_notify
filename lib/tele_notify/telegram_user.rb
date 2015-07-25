
module TeleNotify
  class TelegramUser < ::ActiveRecord::Base

    validates_presence_of :telegram_id

  end

end
