class EspnApi

  def mariners
    response = Faraday.get("http://api.espn.com/v1/sports/baseball/mlb/teams/12/news?apikey=#{ENV['ESPN_API_KEY']}")
    parsed_response_body = parse_json(response.body)
    parsed_response_body["headlines"]
  end

  def clippers
    response = Faraday.get("http://api.espn.com/v1/sports/basketball/nba/teams/12/news?apikey=#{ENV['ESPN_API_KEY']}")
    parsed_response_body = parse_json(response.body)
    parsed_response_body["headlines"]
  end

  private

  def parse_json(response_body)
    Oj.load(response_body)
  end

end