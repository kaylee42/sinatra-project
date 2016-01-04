class UserController < ApplicationController


  get '/signup' do
    erb :"user/signup"
  end

  post '/signup' do
    user = User.new(params[:user])
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

  get '/user/:id' do
    if params[:id] == session[:user_id]
      redirect to '/account'
    else
      @user = User.find(params[:id])
      erb :"user/friend"
    end
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

  get '/logout' do
    session.clear
    redirect to '/'
  end



end
