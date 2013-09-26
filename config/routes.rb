WhodiniWebSite::Application.routes.draw do
  mount Nkss::Engine => '/styleguides' if Rails.env.development?

  get "welcome/index"

  get '/business-engagement', :to => 'welcome#businessEngagement'
  get '/solutions', :to => 'welcome#solutions'
  get '/developer-platform', :to => 'welcome#developerPlatform'
  get '/about', :to => 'welcome#about'
  get '/team', :to => 'welcome#team'
  get '/press', :to => 'welcome#press'
  get '/terms', :to => 'welcome#terms'
  get '/privacy', :to => 'welcome#privacy'

  # redirect_to_whodini_app
  post "/redirect_to_whodini_app"=> "welcome#redirect_to_whodini_app"

  match '*path' => redirect('/') if Rails.env.production?

  # contact form mailer
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
