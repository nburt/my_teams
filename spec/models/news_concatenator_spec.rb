require 'spec_helper'

describe NewsConcatenator do

  let(:clippers) { Oj.load(File.read("./spec/support/clippers.json")) }
  let(:mariners) { Oj.load(File.read("./spec/support/mariners.json")) }

  it 'can return a sorted array of articles' do
    news_concatenator = NewsConcatenator.new(mariners, clippers)
    expect(news_concatenator.merge[0][:headline]).to eq 'Robinson Cano sits with sore hand'
    expect(news_concatenator.merge[1][:headline]).to eq 'Martinez, Cabrera lead Detroit past Seattle 6-3'
  end

end