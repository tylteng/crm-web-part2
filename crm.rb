require 'sinatra'
require_relative 'contact'

get '/contacts' do
  @all_contacts = Contact.all
  erb :index
end

get '/contacts/new' do
  erb :new
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/')
end

get '/about' do
  erb :about
end

get '/contacts/:id' do
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
