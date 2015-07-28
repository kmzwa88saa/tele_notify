#Set your home URL, so Telegram callbacks work
#
#For production, just use your URL (e.g. https://myapp.com)
#You MUST NOT include a trailing slash and it MUST be https!
#INVALID URLS: e.g. http://myapp.com or https://myapp.com/
#
#For development, download ngrok from https://ngrok.com/.
#Extract it and run "./ngrok http 3000"
#Then copy the URL from the console window.
#Remember to use the HTTPS URL!
TeleNotify::TelegramUser.configure_home_url("https://42ebfa35.ngrok.io/")

#Set your Telegram Bot API token here
#Don't have your token yet? Create your bot using https://telegram.me/botfather
TeleNotify::TelegramUser.configure_token("YOUR TOKEN HERE")
