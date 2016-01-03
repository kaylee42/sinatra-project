class BookController < ApplicationController

get '/book/:id' do
  @book = Book.find(params[:id])
  erb :"book/view"
end

end
