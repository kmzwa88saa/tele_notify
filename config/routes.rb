Rails.application.routes.draw do
  post '/route' => 'tele_notify/telegram#webhook'
end
