class Plexserver < ActiveRecord::Base
  belongs_to :user
  has_many :plexmedia
  validates :name, :url, :port, :token, presence: true

  def get_media
    Plex.configure do |config|
      config.auth_token = token
    end
    server = Plex::Server.new(url, port)
    sections = server.library.sections

    sections.each do |section|
      @movies = section if section.title == movies_library
    end

    @movies.recently_added[0..4].reverse.each do |movie| 
      entry = Plexmedium.find_or_initialize_by(plexserver_id: self.id, title: movie.title)
      entry.update(
        title:          movie.title,
        mediatype:      movie.type,
        key:            movie.key,
        plexserver_id:  self.id
      )
    end

    Plex.configure do |config|
      config.auth_token = "xxx"
    end
  end

end
