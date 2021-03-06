Rails.application.routes.draw do

  Rails.application.routes.draw do
    post 'login', to: 'authentication#login'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
  resources :lines do
    resources :brands, except:[:index] do
      resources :products, except:[:index]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lines#index"
end
