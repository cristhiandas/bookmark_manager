ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'

class Bookmark < Sinatra::Base

 get '/links' do
   @links = Link.all
   erb(:links)
 end

 get '/links/new' do
   erb(:add_link)
 end

 post '/links' do
   Link.create(title: params[:Title], url: params[:URL])
   redirect "/links"
 end

end
