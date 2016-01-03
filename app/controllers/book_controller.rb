class BookController < ApplicationController


post '/book/rate' do
  Rating.create(params[:rating])
  redirect to "book/#{params[:rating][:book_id]}"
end

get '/book/:id' do
  @book = Book.find(params[:id])
  erb :"book/view"
end

get '/genres' do
  erb :"book/genres"
end

get '/genres/:id' do
  @genre = Genre.find(params[:id])
  erb :"book/genre_view"
end

end
