Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/walkability_score', to: 'geocoder#walkability_score'
  root to: 'home#show'
end
