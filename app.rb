#ISBN Web Application

require 'sinatra'
require_relative 'isbn.rb'
require_relative 'isbn13.rb'
enable 'sessions'


get '/' do

  erb :root

end

post '/isbn' do
  session[:i10] = params[:i10]
  session[:i13] = params[:i13]
  
end
