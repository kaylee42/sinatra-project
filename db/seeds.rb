
genres = Genre.all.map {|g| g.id}
authors = Author.all.map {|a| a.id}

500.times {Book.create(name: Faker::Book.title, author_id: authors.sample, genre_id: genres.sample)}
