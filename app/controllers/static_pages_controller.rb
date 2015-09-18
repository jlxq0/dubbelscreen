class StaticPagesController < ApplicationController
  def home
    redirect_to '/'+current_user.name if user_signed_in?
  end
end
