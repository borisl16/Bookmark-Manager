# in spec/features/viewing_bookmarks_spec.rb
require 'pg'


feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add('www.ruby.com')
    Bookmark.add('www.google.com')
    Bookmark.add('www.makers.com')

    visit('/bookmarks')

    expect(page).to have_content "www.ruby.com"
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.makers.com"
  end
end
