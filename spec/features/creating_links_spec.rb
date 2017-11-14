require 'capybara/rspec'

describe "adding a new link", :type => :feature do
  feature "when opening the page" do
    scenario "it has a form" do
      visit '/links/new'
      expect(page).to have_button('enter link')
    end
  end
  feature "when entering new link" do
    scenario "it has the link to the database" do
      visit '/links/new'
      fill_in 'Title', with: "Google"
      fill_in 'URL', with: "http://google.com"
      click_button 'enter link'
      expect(page).to have_content('Title: Google URL: http://google.com')
    end
  end
end
