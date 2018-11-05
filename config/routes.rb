Rails.application.routes.draw do
  get '/api/v1/forecast', to: 'forecast#show'
end
