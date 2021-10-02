Rails.application.routes.draw do
  resources :albums
  get '/find_words', to: 'albums#find_words', as: 'get_words_list'
  root 'albums#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
