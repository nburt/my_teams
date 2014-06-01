require 'spec_helper'

feature 'visiting the homepage' do

  scenario 'user can see a homepage' do
    visit '/'
    expect(page).to have_content 'My Teams'
  end

end