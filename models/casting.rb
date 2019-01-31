require('pg')
require_relative('movie.rb')
require_relative('star.rb')
require_relative('../db/sql_runner.rb')

class Casting

  attr_reader :id
  attr_accessor :star_id, :movie_id, :fee

  def initialize(casting_data)
    @id = casting_data['id'] if casting_data['id']
    @star_id = casting_data['star_id'].to_i
    @movie_id = casting_data['movie_id'].to_i
    @fee = casting_data['fee'].to_i
  end

  def save()
    sql = "INSERT INTO castings
    (star_id, movie_id, fee)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@star_id, @movie_id, @fee]
    casting = SqlRunner.run( sql,values )[0];
    @id = casting['id'].to_i
  end

  def movies()
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [@movie_id]
    movie = SqlRunner.run(sql, values).first
    return Movie.new(movie)
  end

  def user()
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [@star_id]
    star = SqlRunner.run(sql, values).first
    return Star.new(star)
  end

  def update()
    sql = "UPDATE stars SET (movie_id, star_id, fee) = ($1, $2, $3) WHERE id = $4"
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM castings"
    casting = SqlRunner.run(sql)
    result = casting.map { |casting| Casting.new( casting ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
