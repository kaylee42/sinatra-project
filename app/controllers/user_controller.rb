class UserController < ApplicationController


  get '/signup' do
    erb :"user/signup"
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save && user.username != ""
      session[:user_id] = user.id
      redirect to '/account'
    else
      redirect to '/failure'
    end
  end

  get '/account' do
    erb :"user/account"
  end

  get '/failure' do
    erb :"user/failure"
  end

  get '/login' do
    erb :"user/login"
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user
      redirect to '/account'
    else
      redirect to '/failure'
    end
  end

end
