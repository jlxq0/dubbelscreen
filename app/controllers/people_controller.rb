class PeopleController < ApplicationController
  def index
    @people = Person.where user_id: current_user.id
  end
end
