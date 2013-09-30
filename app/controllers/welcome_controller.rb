class WelcomeController < ApplicationController

  def index
  end

  def terms
  end

  def privacy
  end

  def redirect_to_whodini_app
    @params = '?email='+params[:user][:address]
    url = "#{Rails.configuration.app_url}"
    new_url = url << @params
    redirect_to new_url
  end

end
