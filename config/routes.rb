Hpstrly2::Application.routes.draw do

  root :to => 'urls#index'

  devise_for :users

  resources :urls, :except => [:update, :destroy, :edit, :show, :new]
  get ':short_url' => 'urls#show', as: 'url'

end
