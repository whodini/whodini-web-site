class WelcomeController < ApplicationController
  def index
  end

  def redirect_to_whodini_app
    Rails.env.development?
      new_url = "http://localhost:3000/" << '?email='+params[:user][:address]
    Rails.env.test?
      new_url = "http://ec2-54-215-119-173.us-west-1.compute.amazonaws.com/" << '?email='+params[:user][:address]
    Rails.env.production?
      #TODO: add production endpoint
    redirect_to new_url
  end
end
