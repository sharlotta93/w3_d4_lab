require('pg')
require_relative('models/casting')
require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(movie)
    @title = movie['title']
    @genre = movie['genre']
    @id = movie['id'] if movie['id']
  end

end
