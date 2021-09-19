# in spec/features/viewing_bookmarks_spec.rb

feature 'Viewing bookmarks' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "Boris's Bookmark Manager"
    end

    scenario 'See a list of bookmarks' do
      visit('/bookmarks')

      expect(page).to have_content "https://www.ruby.com"
      expect(page).to have_content "https://www.google.com"
      expect(page).to have_content "https://www.gmail.com"
    end
end
