require "sinatra"
require "pry"

get '/' do
  "Hi, smelly"
end

get '/hello/:name/:city' do
  "Hello, #{params['name']} from #{params['city']}"
end  


get '/search' do
  base_message = "you searched for: #{params['search_term']}"
    if (params['day'])
      base_message = base_message + "and the day is #{params['day']}"
    end
    base_message
end

get '/secret' do
  erb :secret
end

post '/secret' do
  params['message'].reverse
end

get '/sports' do
  if params['times']
   @times = params['times'].to_i
  else
    @times = 5
  end  
  erb:sports
end

get '/car:model' do
  @model = params['model']
  erb :car
end

get '/foods' do
  @foods = {food1: 'Pizza', food2: 'Burgers', food3: 'Hotdogs'}
  erb:foods
end

get '/devpoint' do
  erb:devpoint
end

get '/devpoint/courses' do
  @courses = ['Full Stack Rails', 'Full Stack JS', 'UX']
  erb :devpoint_courses
end

get '/devpoint/students' do
  @students = ['Jake Day', 'Todd Utterback', 'Jordan Ott', 'Jake Sorce']
  erb :devpoint_students
end

get '/students/:name' do
  devpoint_students = {'Jake Sorce' => {hobbies: ['snowboarding', 'hiking', 'coding'] }}
  @student_name = params['name']
  @student_hobbies = devpoint_students[params['name']]
  erb :student_hobbies
end
not_found do
  status 404
  "not found"
end