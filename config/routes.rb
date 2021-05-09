Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    collection do
      post :confirm
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html```