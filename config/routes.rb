Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers, except: [:new,:edit],  :shallow => true do
  
    resources :trainees
    resources :events, except: [:new,:edit]
  end
end
