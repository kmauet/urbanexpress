Rails.application.routes.draw do
  authenticated :user do
    scope "/admin" do
      resources :invoices
      post 'send-invoice-notification-email/:id' => 'invoices#send_invoice_notification_email', as: :send_invoice_notification_email
      
      resources :vehicule_images
      resources :messages
      resources :quotes
      get 'my-quotes/' => 'quotes#my_quotes', as: :my_quotes
      post 'create-message-for-quote/:id' => 'quotes#create_message', as: :create_message_for_quote
      patch 'update_quote_assigned_user/:id' => 'quotes#update_quote_assigned_user', as: :update_quote_assigned_user
      resources :vehicules
      post 'change-user-points/:id' => 'customers#change_user_points', as: :change_user_points
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      

      
      resources :users
      post 'send-reset-password/:id' => 'customers#send_reset_password', as: :send_reset_password

      get '/customer/confirmation', :controller => 'confirmations', :action => 'update', :conditions => { :method => :put }, as: :update_customer_confirmation
      resources :customers #, except: [:create, :edit, :update]
      
    end
  end

  devise_for :users
  #resources :customers, only: [:create, :edit, :update]
  mount_griddler
  mount Payola::Engine => '/payola', as: :payola

  # Customer Web Pages
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }
  devise_scope :customer do
    get "/change-password" => "customers/registrations#edit"
    post "/change-password" => "customers/registrations#update"
  end
  get 'home' => 'web_page#home'
  get 'contact-us' => 'web_page#contact_us'
  get 'about-us' => 'web_page#about_us'
  get 'fleet' => 'web_page#fleet'
  get 'services' => 'web_page#services'
  get 'vehicule-details/:id' => 'web_page#vehicule_details', as: :vehicule_details
  get 'profile-settings' => 'web_page#profile_settings', as: :profile_settings
  get 'edit-profile-settings' => 'web_page#edit_profile_settings', as: :edit_profile_settings
  patch 'profile-settings' => 'web_page#update_profile_settings'
  get 'unpaid-customer-invoices' =>'web_page#show_unpaid_customer_invoices', as: :show_unpaid_customer_invoices
  get 'unpaid-customer-invoice/:id' =>'web_page#show_unpaid_customer_invoice', as: :show_unpaid_customer_invoice
  patch 'submit-accepted-invoice' =>'web_page#submit_accepted_invoice', as: :submit_accepted_invoice
  get 'quote-request' => 'web_page#quote_request'
  get 'quote-success' => 'web_page#quote_success_page', as: :quote_success_page
  post 'quote-request' => 'web_page#create_quote_request', as: :create_quote_request
  post 'contact-us' => 'web_page#create_contact_us_quote_request', as: :create_contact_us_quote_request
  get 'history' => 'web_page#history'
  get 'jobs' => 'web_page#jobs'
  root 'web_page#home'
end
