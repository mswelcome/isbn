#ISBN Web Application

require 'rubygems'
require 'aws-sdk'
require 'sinatra'
require 'csv'
require_relative 'isbn.rb'
require_relative 'isbn13.rb'
require_relative 'fun_with_csv.rb'
load './local_env.rb'
enable :sessions

get '/' do

   erb :root

end

# post '/qwerty' do
#   "Hello World"
# end


post '/qwerty' do                      #
  isbn = params[:isbn]               # ISBN: individuaULS (valid invalid)
  session[:res] = []                 # session results
  puts "#{isbn.length}"

  if isbn.length == 10
    if harmony(isbn) == "valid"      # AND IF VALID
      session[:res] << isbn                    # Push isbn to array
      session[:res] << "valid"                 # valid
      write_fun_with_csv(session[:res])        # write the function to the
    else harmony(isbn) == "invalid"  # And if invalid
      session[:res] << isbn                    # push isbn to array
      session[:res] << "invalid"               # push invalid
      write_fun_with_csv(session[:res])        # write to the csv file
    end                              # end of the first nested if statement
  elsif isbn.length == 13
    if h13(isbn) == "valid"          #IF 13 valid
      session[:res] << isbn                    #push isbn to array
      session[:res] << "valid"
      write_fun_with_csv(session[:res])
    else h13(isbn) == "invalid"
      session[:res] << isbn
      session[:res] << "invalid"
      write_fun_with_csv(session[:res])
    end
  else
    session[:res] << isbn
    session[:res] << "invalid"
    write_fun_with_ csv(session[:res])
  end
session[:csv_arya] = fun_with_csv
write_fun_with_csv(session[:csv_arya])
  redirect '/results'

end

get '/results' do
   erb :results, locals: {res: session[:res], csv_arya: session[:csv_arya]}
end
