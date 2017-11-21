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

get '/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :single_contact
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
