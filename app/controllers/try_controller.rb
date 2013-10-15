class TryController < ApplicationController

  def new
    @try = Try.new
  end


  def create
    @try = Try.new(params[:try])

    if @try.valid?
      TryMailer.new_message(@try).deliver
      redirect_to(:back, :notice => "Your message was successfully sent.")
    else
      render :new
    end
  end
end

