desc "This task is called by the Heroku scheduler add-on"
task :update_data => :environment do
  puts "Updating data from various APIs..."
    User.all.each do |u|
      begin
        Location.where(user_id: u.id).each do |l|
          l.get_weather
        end
      rescue
        puts("Could not fetch weatherdata.")
      end
 
      begin
        Person.where(user_id: u.id).each do |p|
          p.get_activity
          p.get_health
        end
      rescue
        puts("Could not fetch activity and health.")
      end
 
      begin
        Newschannel.where(user_id: u.id).each do |n|
          n.get_news
        end
      rescue
        puts("Could not fetch news.")
      end
 
      begin
        Plexserver.where(user_id: u.id).each do |pm|
          pm.get_media
        end
      rescue
        puts("Could not fetch plexdata.")
      end
    end
  puts "done."
end
