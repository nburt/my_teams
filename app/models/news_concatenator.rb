class NewsConcatenator

  def initialize(mariners_data, clippers_data)
    @mariners_data = mariners_data
    @clippers_data = clippers_data
  end

  def merge
    all_articles = []
    @clippers_data.each do |article|
      clippers_hash = create_clippers_hash(article)
      all_articles << clippers_hash if clippers_hash.present?
    end

    @mariners_data.each do |article|
      mariners_hash = create_mariners_hash(article)
      all_articles << mariners_hash if mariners_hash.present?
    end

    all_articles.sort_by { |article| article[:last_modified] }.reverse
  end

  private

  def create_clippers_hash(article)
    {
      :headline => article["headline"],
      :url => article["links"]["web"]["href"],
      :last_modified => "#{Time.parse(article["lastModified"])}",
    }
  end

  def create_mariners_hash(article)
    {
      :headline => article["headline"],
      :url => article["links"]["web"]["href"],
      :last_modified => "#{Time.parse(article["lastModified"])}",
    }
  end

end