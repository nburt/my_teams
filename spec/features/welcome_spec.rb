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

  scenario 'a user can select the baseball team(s) that they want to add' do
    VCR.use_cassette('features/baseball_select') do
      within 'header' do
        click_link 'Add Teams'
      end
      within '#baseball_container' do
        check 'baseball[18]'
        check 'baseball[12]'
      end
      click_button 'Add Teams'
      expect(page).to have_content 'Nelson Cruz hits MLB-best 20th HR as O\'s halt Astros\' win streak'
      expect(page).to have_content 'Martinez, Cabrera lead Detroit past Seattle 6-3'
    end
  end

  scenario 'a user can select the basketball team(s) that they want to add' do
    VCR.use_cassette('features/basketball_select') do
      within 'header' do
        click_link 'Add Teams'
      end
      within '#basketball_container' do
        check 'basketball[18]'
        check 'basketball[12]'
      end
      click_button 'Add Teams'
      expect(page).to have_content 'Clips sale pending board approval'
      expect(page).to have_content 'Phil talks Melo, search for coach'
    end
  end

  scenario 'a user can select the football team(s) that they want to add' do
    VCR.use_cassette('features/football_select') do
      within 'header' do
        click_link 'Add Teams'
      end
      within '#football_container' do
        check 'football[24]'
        check 'football[12]'
      end
      click_button 'Add Teams'
      expect(page).to have_content 'Shawne Merriman joins WWE'
      expect(page).to have_content 'Alex Smith holds all the cards'
    end
  end

  scenario 'a user can edit the teams that they have added' do
    VCR.use_cassette('features/editing_teams') do
      within 'header' do
        click_link 'Add Teams'
      end
      within '#football_container' do
        check 'football[24]'
      end
      click_button 'Add Teams'

      within 'header' do
        expect(page).to_not have_content 'Add Teams'
        click_link 'Update Teams'
      end
      check 'baseball[18]'
      click_button 'Update Teams'
      expect(page).to have_content 'Dwight Freeney says he\'s 100 percent'
      expect(page).to have_content 'Escobar has 2 RBIs; Rays top Astros 5-2'
    end
  end

end