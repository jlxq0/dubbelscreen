class Newschannel < ActiveRecord::Base
  belongs_to :user
  has_many :news, dependent: :destroy

  def get_news
    rss = RSS::Parser.parse(feedurl, false)
    rss.items[0..4].reverse.each { |item| update_newsitem item }
  end

  protected

  def update_newsitem newsitem
    newsitem = News.find_or_initialize_by(newschannel_id: self.id, title: newsitem.title)
    newsitem.update(
      title: newsitem.title,
      newschannel_id: self.id
    )
  end

end
