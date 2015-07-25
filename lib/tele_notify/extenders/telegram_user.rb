module TeleNotify
  module Extenders

    module TelegramUser

      def telegram_user?
        false
      end

      def acts_as_telegram_user
        require 'tele_notify/telegram_user'
        include TeleNotify::TelegramUser

        class_eval do
          def self.telegram_user?
            true
          end
        end

      end

    end

  end
end
