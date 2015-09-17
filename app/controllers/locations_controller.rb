class LocationsController < ApplicationController
  def index
    @locations = Location.where user_id: current_user.id
  end
end
