Rails.application.routes.draw do
  resources :lines do
    resources :brands, except:[:index] do
      resources :products, except:[:index]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lines#index"
end
