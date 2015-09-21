class TriggersController < ApplicationController
  def index
    @user = User.where(name: params[:user_name]).first
    if @user
      Location.where(user_id: @user.id).each do |l|
        l.get_weather
      end

      Person.where(user_id: @user.id).each do |p|
        p.get_activity
        p.get_weight
      end

      Newschannel.where(user_id: @user.id).each do |n|
        n.get_news
      end

      Plexserver.where(user_id: @user.id).each do |pm|
        pm.get_media
      end
    end
  end
end
