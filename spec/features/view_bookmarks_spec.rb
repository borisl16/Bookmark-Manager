# in spec/features/viewing_bookmarks_spec.rb

feature 'Viewing bookmarks' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "Boris's Bookmark Manager"
    end

    scenario 'A user can see bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.ruby.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.google.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.gmail.com');")
  
      visit('/bookmarks')
      expect(page).to have_content 'https://www.ruby.com'
      expect(page).to have_content 'https://www.google.com'
      expect(page).to have_content 'https://www.gmail.com'
    end
end
