
feature 'Viewing bookmarks' do
    scenario 'visiting the index page' do
      visit('/bookmarks')
      expect(page).to have_content "www.ruby.com" 
      expect(page).to have_content "www.google.com"
      expect(page).to have_content "www.makersk.com"
    end
  end
  