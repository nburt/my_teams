class EspnApi

  def baseball(ids)
    responses = []
    if have_ids?(ids)
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
    end
    responses
  end

  def basketball(ids)
    responses = []
    if have_ids?(ids)
      if ids.class == Fixnum
        response = Faraday.get("http://api.espn.com/v1/sports/basketball/nba/teams/#{ids}/news?apikey=#{ENV['ESPN_API_KEY']}")
        parsed_response_body = parse_json(response.body)
        parsed_response_body["headlines"]
      else
        ids.split(", ").each do |id|
          response = Faraday.get("http://api.espn.com/v1/sports/basketball/nba/teams/#{id}/news?apikey=#{ENV['ESPN_API_KEY']}")
          parsed_response_body = parse_json(response.body)
          responses << parsed_response_body["headlines"]
        end
      end
    end
    responses
  end

  def football(ids)
    responses = []
    if have_ids?(ids)
      if ids.class == Fixnum
        response = Faraday.get("http://api.espn.com/v1/sports/football/nfl/teams/#{ids}/news?apikey=#{ENV['ESPN_API_KEY']}")
        parsed_response_body = parse_json(response.body)
        parsed_response_body["headlines"]
      else
        ids.split(", ").each do |id|
          response = Faraday.get("http://api.espn.com/v1/sports/football/nfl/teams/#{id}/news?apikey=#{ENV['ESPN_API_KEY']}")
          parsed_response_body = parse_json(response.body)
          responses << parsed_response_body["headlines"]
        end
      end
    end
    responses
  end

  private

  def parse_json(response_body)
    Oj.load(response_body)
  end

  def have_ids?(ids)
    if ids.nil?
      false
    else
      true
    end
  end

end