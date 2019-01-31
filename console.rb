require('pry')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting.rb')

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


binding.pry
nil
