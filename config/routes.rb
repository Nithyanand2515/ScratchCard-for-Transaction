Rails.application.routes.draw do


resources :users do

    resources :bank_accounts
resources :transactions, except: [:create]
end
resources :transactions, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
