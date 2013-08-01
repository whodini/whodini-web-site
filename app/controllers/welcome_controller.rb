class WelcomeController < ApplicationController
  def index
  end

  def redirect_to_whodini_app
        subdomain = request.subdomain
        # if subdomain == 'secure'
        params = request.original_fullpath.split("?").second
        new_url = "http://localhost:10524/" << params
        redirect_to new_url
        # end
    end
end
