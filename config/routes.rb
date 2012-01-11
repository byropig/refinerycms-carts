::Refinery::Application.routes.draw do
  resources :carts, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :carts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :line_items, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :line_items, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
