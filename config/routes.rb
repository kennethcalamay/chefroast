Chefroast::Application.routes.draw do
  devise_for :users
  resources :products do
    get :drafts, on: :collection
  end
  get 'about' => 'static#about'
  get 'contact' => 'static#contact'
  root to: "products#index"
end
