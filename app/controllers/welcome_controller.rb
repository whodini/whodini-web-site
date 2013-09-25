class WelcomeController < ApplicationController
  def index
  end

  def redirect_to_whodini_app
    @params = '?email='+params[:user][:address]
    url = "#{Rails.configuration.app_url}"
    new_url = url << @params
    redirect_to new_url
  end

  def businessEngagement
  end

  def solutions
  end

  def developerPlatform
  end

  def about
  end

  def team
  end

  def press
  end

  def contact
  end

  def terms
  end

  def privacy
  end

end
