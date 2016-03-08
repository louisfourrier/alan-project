Rails.application.routes.draw do






  get 'search/result'

  devise_for :users

  # Page accessible for connected Users
  resources :users do
    # Depend on USer. Nested Resources
    resources :invoices
    resources :packagings
    resources :employees do
      member do
        get 'complete_profile'
      end

    end

  end

  resources :packages

  resources :legal_informations

  # Public Pages

  root "home#main"
  get 'contact', :to => "home#contact"



  get 'test/first'
  get 'test/second'
  get 'test/third'

end
