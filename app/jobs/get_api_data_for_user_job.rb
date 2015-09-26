class GetApiDataForUserJob < ActiveJob::Base
  queue_as :default

  def perform_later(user_name)
    @user = User.where(name: user_name).first

    if @user
 
      begin
        Person.where(user_id: @user.id).each do |p|
          p.get_activity
          p.get_health
        end
      rescue
        logger.info("Could not fetch activity and health.")
      end
 
    end
  end
end
