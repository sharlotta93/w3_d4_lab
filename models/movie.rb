require('pg')
require_relative('casting.rb')
require_relative('movie.rb')
require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(movie)
    @title = movie['title']
    @genre = movie['genre']
    @id = movie['id'] if movie['id']
  end

  def save()
    sql = "INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def update()
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    result = SqlRunner.run(sql).first
    return result.map{ |movie| Movie.new(movie)}
 end

end
