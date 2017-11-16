require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

after do
  ActiveRecord::Base.connection.close
end
