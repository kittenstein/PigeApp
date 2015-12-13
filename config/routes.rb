Rails.application.routes.draw do
root                       "static_pages#home"
get    'help'           => "static_pages#help"
get    'about'          => "static_pages#about"
get    'contact'        => "static_pages#contact"

get    'login'          => "sessions#new"
post   'login'          => "sessions#create"
get 'logout'         => "sessions#destroy"

get    'show_events'    => "events#show"
post   'new_event'      => "events#create"

get    'show_contests'  => "contests#show"
post   'new_contest'    => "contests#create"

get    'show_contests/:id' => "contests#edit"
post   'new_pigeon'    => "contests#create_pigeon"

resources :users
end
