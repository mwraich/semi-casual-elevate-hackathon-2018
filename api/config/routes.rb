Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/events", controller: :programs, action: :index
  get "/programs", controller: :programs, action: :index
end
