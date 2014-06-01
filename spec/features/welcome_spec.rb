require 'spec_helper'

feature 'visiting the homepage' do

  scenario 'displays mariners headlines on homepage' do
    VCR.use_cassette('features/mariners_news') do
      visit '/'
      expect(page).to have_content 'Martinez, Cabrera lead Detroit past Seattle 6-3'
      expect(page).to have_link 'Read on ESPN'
      expect(page).to have_content ' '
    end
  end

end