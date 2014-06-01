class NewsConcatenator

  def initialize(mariners_data, clippers_data, chargers_data)
    @mariners_data = mariners_data
    @clippers_data = clippers_data
    @chargers_data = chargers_data
  end

  def merge
    all_articles = []
    @clippers_data.each do |article|
      clippers_hash = create_news_hash(article)
      all_articles << clippers_hash if clippers_hash.present?
    end

    @mariners_data.each do |article|
      mariners_hash = create_news_hash(article)
      all_articles << mariners_hash if mariners_hash.present?
    end

    @chargers_data.each do |article|
      chargers_hash = create_news_hash(article)
      all_articles << chargers_hash if chargers_hash.present?
    end

    all_articles.sort_by { |article| article[:last_modified] }.reverse
  end

  private

  def create_news_hash(article)
    {
      :headline => article["headline"],
      :url => article["links"]["web"]["href"],
      :last_modified => "#{Time.parse(article["lastModified"])}",
    }
  end

end