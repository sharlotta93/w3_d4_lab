require('pry')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting.rb')

# Casting.delete_all()
# Star.delete_all()
# Movie.delete_all()

star_1 = Star.new( {
  'name' => 'Jessica Jones'
  }
)

star_2 = Star.new( {
    'name' => 'John Ceeena'
  }
)

star_1.save()
star_2.save()

movie_1 = Movie.new( {
   'title' => 'Cinderella Story',
   'genre' => 'Horror'
  }
)

movie_2 = Movie.new( {
   'title' => 'Daddys Home',
   'genre' => 'Comedy'
  }
)


movie_1.save()
movie_2.save()


casting_1 = Casting.new( {
  'star_id' => star_1.id,
  'movie_id' => movie_2.id,
  'fee' => 3000
  }
)

casting_2 = Casting.new( {
  'star_id' => star_2.id,
  'movie_id' => movie_1.id,
  'fee' => 6000
  }
)

casting_3 = Casting.new( {
  'star_id' => star_1.id,
  'movie_id' => movie_1.id,
  'fee' => 4000
  }
)

casting_1.save()
casting_2.save()
casting_3.save()

binding.pry
nil
