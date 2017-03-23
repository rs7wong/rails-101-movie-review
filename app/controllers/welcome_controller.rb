class WelcomeController < ApplicationController
  def index
    flash[:notice] = "welcome!"
    flash[:alert] = "Review carefully!"
    flash[:warning] = "Please friendly."
  end
end
