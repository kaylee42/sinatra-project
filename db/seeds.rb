
books = Book.all.map {|g| g.id}
users = User.all.map {|a| a.id}
amount = [1,2,3,4,5,6,7,8]

1000.times {Rating.create(amount: amount.sample, book_id: books.sample, user_id: users.sample)}
