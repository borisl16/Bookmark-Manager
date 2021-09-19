require 'bookmark'

describe Bookmark do
    describe '.all' do
        it 'returns a list of bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.ruby.com');")
            connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
            connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.gmail.com');")

            bookmarks = Bookmark.all

            expect(bookmarks).to include('https://www.ruby.com')
            expect(bookmarks).to include('https://www.google.com')
            expect(bookmarks).to include('https://www.gmail.com')
        end
    end
end