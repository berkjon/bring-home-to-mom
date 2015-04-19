class WelcomeController < ApplicationController

  def index
        @first_child = current_user.children.first if user_signed_in?
  end


end
