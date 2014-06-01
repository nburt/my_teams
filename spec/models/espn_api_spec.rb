require 'spec_helper'

describe EspnApi do

  it 'can get a stream for baseball' do
    VCR.use_cassette('models/mariners_news') do
      espn_api = EspnApi.new
      expect(espn_api.baseball(12).flatten[0]["headline"]).to eq 'Martinez, Cabrera lead Detroit past Seattle 6-3'
    end
  end

  it 'can get a stream for the la clippers' do
    VCR.use_cassette('models/clippers_news') do
      espn_api = EspnApi.new
      expect(espn_api.clippers[0]['headline']).to eq 'Clips sale pending board approval'
    end
  end

  it 'can get a stream for the san diego chargers' do
    VCR.use_cassette('models/chargers_news') do
      espn_api = EspnApi.new
      expect(espn_api.chargers[0]['headline']).to eq 'Malcom Floyd cleared for contact'
    end
  end

end