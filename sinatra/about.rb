require 'sinatra'

get '/' do
  erb :about
end

get '/contact_me' do
  erb :contact_me
end

get '/resume' do 
  erb :resume
end