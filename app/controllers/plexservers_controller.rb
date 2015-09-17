class PlexserversController < ApplicationController
  def index
    @plexservers = Plexserver.where user_id: current_user.id
  end
end
