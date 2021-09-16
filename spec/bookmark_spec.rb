require 'bookmark'

describe Bookmark do
    describe '.all' do
        it 'returns all bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            Bookmark.add('www.ruby.com')
            Bookmark.add('www.google.com')
            Bookmark.add('www.makers.com')
        
            bookmarks = Bookmark.all

            expect(bookmarks).to include("www.ruby.com")  
            expect(bookmarks).to include("www.google.com")
            expect(bookmarks).to include("www.makers.com")
        end
    end
end
