Chefroast::Application.routes.draw do
  devise_for :users
  root to: "products#index"
end
