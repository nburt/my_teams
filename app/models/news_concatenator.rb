class NewsConcatenator

  def initialize(baseball_data, basketball_data, football_data = nil)
    @baseball_data = baseball_data
    @basketball_data = basketball_data
    @football_data = football_data
  end

  def merge
    all_articles = []

    if @basketball_data != nil
      @basketball_data.each do |articles|
        clippers_hash = create_news_hash(articles)
        all_articles << clippers_hash if clippers_hash.present?
      end
    end

    if @baseball_data != nil
      @baseball_data.each do |articles|
        mariners_hash = create_news_hash(articles)
        all_articles << mariners_hash if mariners_hash.present?
      end
    end

    if @football_data != nil
      @football_data.each do |articles|
        chargers_hash = create_news_hash(articles)
        all_articles << chargers_hash if chargers_hash.present?
      end
    end

    all_articles.flatten.sort_by { |article| article[:last_modified] }.reverse
  end

  private

  def create_news_hash(articles)
    articles.map do |article|
      {
        :headline => article["headline"],
        :url => article["links"]["web"]["href"],
        :last_modified => "#{Time.parse(article["lastModified"])}",
      }
    end
  end

end