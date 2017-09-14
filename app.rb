#ISBN Web Application

require 'rubygems'
require 'aws-sdk'
require 'sinatra'
require 'csv'
require_relative 'isbn.rb'
require_relative 'isbn13.rb'
require_relative 'fun_with_csv.rb'
require_relative 's3.rb'
require_relative 'dls3.rb'
load './local_env.rb'
enable :sessions

get '/' do

   erb :root

end

post '/qwerty' do                      #
  isbn = params[:isbn]               # ISBN: individuaULS (valid invalid)
  session[:res] = []                   # session results

  dl_s3()

  session[:csv_arya] = fun_with_csv
  write_fun_with_csv(session[:csv_arya])

  if isbn.length == 10
    if harmony(isbn) == "valid"
      sessioin[:res] << session[:csv_arya].length + 1
      session[:res] << isbn                    # Push isbn to array
      session[:res] << "valid"
      append_fun_with_csv(session[:res])
    else harmony(isbn) == "invalid"
      session[:res] << session[:csv_arya].length + 1
      session[:res] << isbn                    # push isbn to array
      session[:res] << "invalid"
      append_fun_with_csv(session[:res])
    end
  elsif isbn.length == 13
    if h13(isbn) == "valid"          #IF 13 valid
      session[:res] << session[:csv_arya].length + 1
      session[:res] << isbn
      session[:res] << "valid"
      append_fun_with_csv(session[:res])
    else h13(isbn) == "invalid"
      session[:res] << session[:csv_arya].length + 1
      session[:res] << isbn
      session[:res] << "invalid"
      append_fun_with_csv(session[:res])
    end
  else
    session[:res] << session[:csv_arya].length + 1
    session[:res] << isbn
    session[:res] << "invalid"
    append_fun_with_csv(session[:res])
  end

connect_to_s3()

  redirect '/results'

end

get '/results' do
   erb :results, locals: {res: session[:res], csv_arya: session[:csv_arya]}
end
