require 'capybara/rspec'

describe 'Bookmark', :type => :feature do
  feature 'When starting a new page' do
    scenario 'Has list of links' do
      visit'/links'
      expect(page).to have_content('List of links: ')
    end
  end

  feature 'Viewing links' do
    scenario 'I can see existing links on the links page' do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit '/links'
      expect(page.status_code).to eq 200
      within 'ul#links' do
        expect(page).to have_content('Makers Academy')
      end
    end
  end
end
