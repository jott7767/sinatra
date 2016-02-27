require 'sinatra'
require 'pry'

get '/' do
  @selections = ['Command line', 'Search', 'Google']
  erb :menu
end

get '/command_line' do
  @list_command = ['cp', 'ls', 'mkdir', 'touch', 'mv']
  erb :command_line
end

get '/command' do
  man = params[:command]
   @man_page =  `man #{man}`
    erb :command
end

get '/search' do
  erb :search
end

post '/search_result' do
   @results = `man #{params['input']}`
   erb :search_result
end

not_found do
  status 404
  "not found"
end