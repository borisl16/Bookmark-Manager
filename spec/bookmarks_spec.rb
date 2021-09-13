require 'bookmark'

describe Bookmark do
    describe '.all' do
        it 'returns all bookmarks' do
            bookmarks = Bookmark.all
            expect(bookmarks).to include("www.ruby.com")  
            expect(bookmarks).to include("www.yahoo.com")
            expect(bookmarks).to include("www.google.com")
        end
    end
end

