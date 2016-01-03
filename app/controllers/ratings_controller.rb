class RatingsController < ApplicationController

  get '/rate' do
    erb :"ratings/new"
  end

  post '/rate' do
    info = params[:book][:name].split(" - ")
    if info.length == 3
      book = Book.find(info[2])
      Rating.create(amount: params[:rating][:amount], book_id: book.id, user_id: session[:user_id])
      redirect to '/account'
    else
      author = Author.find_or_create_by(params[:author])
      book = Book.new(name: params[:book][:name], author_id: author.id)
      if author && book.save
        Rating.create(amount: params[:rating][:amount], book_id: book.id, user_id: session[:user_id])
        redirect to '/account'
      else
        @errors = book.errors.messages
        erb :"ratings/new"
      end
    end
  end

  get '/rating/:id' do
    @rating = Rating.find(params[:id])
    if @rating && session[:user_id] == @rating.user.id
       erb :"ratings/edit"
    else
      redirect to '/failure'
    end
  end

  post '/rating/edit' do
    rating = Rating.find(params[:rating_id])
    rating.update(params[:rating])
    redirect to '/account'
  end

  post '/rating/delete' do
    rating = Rating.find(params[:rating_id])
    rating.destroy
    redirect to '/account'
  end

end
