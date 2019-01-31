require('pry')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting')


star_1 = Star.new( {
  'name' => 'Jessica Jones'
  }
)

star_2 = Star.new( {
    'name' => 'John Ceeena'
  }
)

movie_1 = Movie.new( {
   'title' => 'Cinderella Story',
   'genre' => 'Horror'
  }
)

movie_2 = Movie.new( {
   'title' => 'Daddy's Home',
   'genre' => 'Comedy'
  }
)
