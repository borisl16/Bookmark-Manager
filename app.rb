require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
      erb :index
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file == $0
end
