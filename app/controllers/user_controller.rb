class UserController < ApplicationController


  get '/signup' do
    erb :"user/signup"
  end

  post '/signup' do
    user = User.new(params[:user])
    # binding.pry
    if user.save
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
      session[:user_id] = user.id
      redirect to '/account'
    else
      redirect to '/failure'
    end
  end

  post '/logout' do
    session.clear
    redirect to '/'
  end



end
