Rails.application.routes.draw do






  devise_for :users

  # Page accessible for connected Users
  resources :users do
    # Depend on USer. Nested Resources
    resources :invoices
    resources :packagings
    resources :employees

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
