Rails.application.routes.draw do

  root to: "foods#index"
  get '/menu' => 'foods#index'
  get '/month', to: 'foods#month', as: :month
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
