require 'pg'

class Bookmark
    def self.all
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'bookmark_manager')
        end
        
        result = connection.exec('SELECT * FROM bookmarks;')
        url = result.map { |bookmark| bookmark['url'] }
        title = result.map { |bookmark| bookmark['title'] }
        counter = 0
        temp = ""
        url.each do |n|
            temp += "<a href='#{n}'>'#{title[counter]}'</a><br>"
            counter += 1
        end
        temp
    end

    def self.add(url,title)
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'bookmark_manager')
        end
        
        connection.exec("INSERT INTO bookmarks (url,title) VALUES ('#{url}', '#{title}');")
    end
   
end