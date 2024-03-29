WhodiniWebSite::Application.routes.draw do
  mount Nkss::Engine => '/styleguides' if Rails.env.development?

  get "welcome/index"

  # generate named routes for whodini sections based on action names
  CompanyController.action_methods.each do |action|
    get "company/#{action}", to: "company##{action}"
  end

  TechnologyController.action_methods.each do |action|
    get "technology/#{action}", to: "technology##{action}"
  end

  match 'terms' => 'welcome#terms', :as => '/terms'
  match 'privacy' => 'welcome#privacy', :as => '/privacy'
  match 'faq' => 'welcome#faq', :as => '/faq'

  # redirect_to_whodini_app
  post "/redirect_to_whodini_app"=> "welcome#redirect_to_whodini_app"

  # contact form mailer
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  # try whodini mailer
  match 'try' => 'try#new', :as => 'try', :via => :get
  match 'try' => 'try#create', :as => 'try', :via => :post

  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  # Catch all route should always be at the end.
  match '*path' => redirect('/') if Rails.env.production?
end
