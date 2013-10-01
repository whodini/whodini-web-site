class TryController < ApplicationController

  def new
    @try = Try.new
  end

  def create
    @try = Try.new(params[:try])

    if @try.valid?
      TryMailer.new_message(@try).deliver
      redirect_to(:back, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end
end

