Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home' => 'web_page#home'
  get 'contact-us' => 'web_page#contact_us'
  get 'about-us' => 'web_page#about_us'
  get 'fleet' => 'web_page#fleet'
  get 'services' => 'web_page#services'
  get 'vehicule-details' => 'web_page#vehicule_details'
  root 'web_page#home'
end
