Chefroast::Application.routes.draw do
  devise_for :users
  resources :products do
    get :drafts, on: :collection
  end
  root to: "products#index"
end
