Rails.application.routes.draw do
 
  resources :trainers, except: [:new,:edit]
  resources :trainees, except: [:new,:edit]
  resources :events, except: [:new,:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
