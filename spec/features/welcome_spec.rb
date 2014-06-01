require 'spec_helper'

feature 'visiting the homepage' do

  before do
    VCR.use_cassette('features/registration') do
      visit '/'
      fill_in 'user[email]', :with => 'nate@example.com'
      fill_in 'user[password]', :with => 'password'
      click_button 'Register'
      expect(page).to have_content 'Welcome, nate@example.com'
    end
  end

  scenario 'a user can login' do
    VCR.use_cassette('features/login') do
      click_link 'Logout'
      click_link 'Login'
      fill_in 'user[email]', :with => 'nate@example.com'
      fill_in 'user[password]', :with => 'password'
      click_button 'Login'
      expect(page).to have_content 'Welcome, nate@example.com'
    end
  end

  scenario 'a user cannot login with incorrect credentials' do
    VCR.use_cassette('features/incorrect_login') do
      click_link 'Logout'
      click_link 'Login'
      fill_in 'user[email]', :with => 'nate@example.com'
      fill_in 'user[password]', :with => 'password1'
      click_button 'Login'
      expect(page).to have_content 'Invalid email or password'
    end
  end

  scenario 'displays mariners headlines on homepage' do
    pending
    VCR.use_cassette('features/mariners_news') do
      expect(page).to have_content 'Martinez, Cabrera lead Detroit past Seattle 6-3'
      expect(page).to have_link 'Read on ESPN'
    end
  end

  scenario 'displays clippers headlines on homepage' do
    pending
    VCR.use_cassette('features/clippers_news') do
      expect(page).to have_content 'Clips sale pending board approval'
    end
  end

  scenario 'displays chargers headlines on homepage' do
    pending
    VCR.use_cassette('features/chargers_news') do
      expect(page).to have_content 'Shawne Merriman joins WWE'
    end
  end

  scenario 'a user can select the baseball team that they want to join' do
    VCR.use_cassette('features/baseball_select') do
      within 'header' do
        click_link 'Add Teams'
      end
      check '18'
      check '12'
      click_button 'Add Teams'
      expect(page).to have_content 'Nelson Cruz hits MLB-best 20th HR as O\'s halt Astros\' win streak'
      expect(page).to have_content 'Martinez, Cabrera lead Detroit past Seattle 6-3'
    end
  end

end