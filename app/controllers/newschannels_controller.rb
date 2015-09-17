class NewschannelsController < ApplicationController
  def index
    @newschannels = Newschannel.where user_id: current_user.id
  end
end
