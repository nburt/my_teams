class EspnApi

  def baseball(ids)
    responses = []
    if ids.class == Fixnum
      response = Faraday.get("http://api.espn.com/v1/sports/baseball/mlb/teams/#{ids}/news?apikey=#{ENV['ESPN_API_KEY']}")
      parsed_response_body = parse_json(response.body)
      responses << parsed_response_body["headlines"]
    else
      ids.split(", ").each do |id|
        response = Faraday.get("http://api.espn.com/v1/sports/baseball/mlb/teams/#{id}/news?apikey=#{ENV['ESPN_API_KEY']}")
        parsed_response_body = parse_json(response.body)
        responses << parsed_response_body["headlines"]
      end
    end
    responses
  end

  def clippers
    response = Faraday.get("http://api.espn.com/v1/sports/basketball/nba/teams/12/news?apikey=#{ENV['ESPN_API_KEY']}")
    parsed_response_body = parse_json(response.body)
    parsed_response_body["headlines"]
  end

  def chargers
    response = Faraday.get("http://api.espn.com/v1/sports/football/nfl/teams/24/news?apikey=#{ENV['ESPN_API_KEY']}")
    parsed_response_body = parse_json(response.body)
    parsed_response_body["headlines"]
  end

  private

  def parse_json(response_body)
    Oj.load(response_body)
  end

end