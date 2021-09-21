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

    # in spec/bookmark_spec.rb

describe '.create' do
    it 'creates a new bookmark' do
        Bookmark.create(url: 'http://www.youtube.com')
  
        expect(Bookmark.all).to include 'http://www.youtube.com'
    end
  end
  


end