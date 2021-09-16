# in spec/features/viewing_bookmarks_spec.rb
require 'pg'


feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'www.ruby.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'www.makers.com');")

    visit('/bookmarks')

    expect(page).to have_content "www.ruby.com"
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.makers.com"
  end
end
