class WelcomeController < ApplicationController
  def index
  end

  def redirect_to_whodini_app
    @params = '?email='+params[:user][:address]
    new_url = "http://localhost:3000/" << @params if Rails.env.development? 
    new_url = "http://ec2-54-215-119-173.us-west-1.compute.amazonaws.com/" << @params if Rails.env.aws_dev?
    new_url = 'TODO: add production endpoint' << @params if Rails.env.production?
    redirect_to new_url
  end
end
