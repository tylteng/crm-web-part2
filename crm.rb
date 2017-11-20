require 'sinatra'
require_relative 'contact'

get '/' do
  @all_contacts = Contact.all
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
