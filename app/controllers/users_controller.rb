class UsersController < ApplicationController
  def show
    @user = current_user
    @people = Person.where(user_id: current_user.id)
    @weight = '%.1f' % Weightdatum.first.withings_weight
    @weather = Weatherdatum.first
    @news = News.last(5).reverse
    @movies = Plexmedium.last(5).reverse
  end
end
