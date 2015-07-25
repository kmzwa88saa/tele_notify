require 'active_record'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module TeleNotify

  if defined?(ActiveRecord::Base)
    require 'tele_notify/extenders/telegram_user' #not sure
    require 'tele_notify/telegram_user'
    ActiveRecord::Base.extend TeleNotify::Extenders::TelegramUser
  end

end
