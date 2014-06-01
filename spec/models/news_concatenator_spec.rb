require 'spec_helper'

describe NewsConcatenator do

  let(:clippers) { Oj.load(File.read("./spec/support/clippers.json")) }
  let(:mariners) { Oj.load(File.read("./spec/support/mariners.json")) }
  let(:chargers) { Oj.load(File.read("./spec/support/chargers.json")) }

  it 'can return a sorted array of articles' do
    news_concatenator = NewsConcatenator.new(mariners, clippers, chargers)
    merged_news = news_concatenator.merge
    expect(merged_news[0][:headline]).to eq 'Robinson Cano sits with sore hand'
    expect(merged_news[1][:headline]).to eq 'Martinez, Cabrera lead Detroit past Seattle 6-3'
  end

end