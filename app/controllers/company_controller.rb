class CompanyController < ApplicationController
  before_filter :check_for_mobile, :only => [:about]

  def about
  end

  def careers
  end

  def press
  end

  def publications
  end

  def advisors
  end

  def investors
  end

  def team
  end

end