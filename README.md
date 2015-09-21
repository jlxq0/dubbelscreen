== README

Creating an info display. With dubbelscreen!

Startup and - for now - run:

    Location.all.each do |l|
      l.get_weather
    end

    Person.all.each do |p|
      p.get_activity
      p.get_weight
    end

    Newschannel.all.each do |n|
      n.get_news
    end

    Plexserver.all.each do |pm|
      pm.get_media
    end


http://goo.gl/U3zLfA
