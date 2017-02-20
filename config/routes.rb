Rails.application.routes.draw do
  resources :quotes
  resources :vehicules
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home' => 'web_page#home'
  get 'contact-us' => 'web_page#contact_us'
  get 'about-us' => 'web_page#about_us'
  get 'fleet' => 'web_page#fleet'
  get 'services' => 'web_page#services'
  get 'vehicule-details/:id' => 'web_page#vehicule_details', as: :vehicule_details
  get 'profile-settings' => 'web_page#profile_settings', as: :profile_settings
  get 'edit-profile-settings' => 'web_page#edit_profile_settings', as: :edit_profile_settings
  patch 'profile-settings' => 'web_page#update_profile_settings'
  get 'quote-request' => 'web_page#quote_request'
  post 'quote-request' => 'web_page#create_quote_request', as: :create_quote_request
  get 'history' => 'web_page#history'
  get 'jobs' => 'web_page#jobs'
  root 'web_page#home'

  devise_scope :customer do
    get "/change-password" => "customers/registrations#edit"
    post "/change-password" => "customers/registrations#update"
  end

  devise_for :customers, controllers: {
      registrations: 'customers/registrations',
      sessions: 'customers/sessions',
      passwords: 'customers/passwords'
    }
end
