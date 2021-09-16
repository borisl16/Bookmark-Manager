# in spec/features/viewing_bookmarks_spec.rb
require 'pg'


feature 'Adding bookmarks' do
    scenario 'A user can add bookmarks to the database' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

   
    visit('/')
    click_button('Add bookmark')
    fill_in('url', with: 'www.gmail.com')
    click_button('Submit')
    visit ('/bookmarks')
    expect(page).to have_content "www.gmail.com"
    end
    
end
