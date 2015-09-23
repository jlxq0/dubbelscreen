class TriggersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index]

  def index
    @user = User.where(name: params[:user_name]).first
    if @user

      begin
        Location.where(user_id: @user.id).each do |l|
          l.get_weather
        end
      rescue
        logger.info("Could not fetch weatherdata.")
      end

      begin
        Person.where(user_id: @user.id).each do |p|
          p.get_activity
          p.get_health
        end
      rescue
        logger.info("Could not fetch activity and health.")
      end

      begin
        Newschannel.where(user_id: @user.id).each do |n|
          n.get_news
        end
      rescue
        logger.info("Could not fetch news.")
      end

      begin
        Plexserver.where(user_id: @user.id).each do |pm|
          pm.get_media
        end
      rescue
        logger.info("Could not fetch plexdata.")
      end

    end
  end
end
