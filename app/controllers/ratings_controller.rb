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
      genre = Genre.find_or_create_by(params[:genre])
      book = Book.new(name: params[:book][:name], author_id: author.id, genre_id: genre.id)
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
    author = Author.find_or_create_by(params[:author])
    genre = Genre.find_or_create_by(params[:genre])
    book = Book.find_or_create_by(name: params[:book][:name], author_id: author.id, genre_id: genre.id)
    rating.update(amount: params[:rating][:amount], book_id: book.id)
    redirect to "/book/#{rating.book.id}"
  end

  post '/rating/delete' do
    rating = Rating.find(params[:rating_id])
    rating.destroy
    redirect to '/account'
  end

end
