class BookController < ApplicationController


post '/book/rate' do
  Rating.create(params[:rating])
  redirect to "book/#{params[:rating][:book_id]}"
end

get '/book/:id' do
  @book = Book.find(params[:id])
  erb :"book/view"
end

end
