require 'spec_helper'

describe EspnApi do

  it 'can get a stream for the seattle mariners' do
    VCR.use_cassette('models/mariners_news') do
      espn_api = EspnApi.new
      expect(espn_api.mariners[0]['headline']).to eq 'Martinez, Cabrera lead Detroit past Seattle 6-3'
    end
  end

end