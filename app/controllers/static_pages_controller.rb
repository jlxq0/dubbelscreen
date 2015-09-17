class StaticPagesController < ApplicationController
  def home
    @weight = '%.1f' % Weightdatum.first.withings_weight
    @weather = Weatherdatum.first
    @news = News.last(5).reverse
    @movies = Plexmedium.last(5).reverse
  end
end
