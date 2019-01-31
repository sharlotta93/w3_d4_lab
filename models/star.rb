require('pg')
require_relative('casting.rb')
require_relative('../db/sql_runner.rb')


class Star

  attr_accessor :name
  attr_reader :id

  def initialize(person)
    @name = person['name']
    @id = person['id'] if person['id']
  end

  def save()
    sql = "INSERT INTO stars (name) VALUES ($1) RETURNING id"
    values = [@name]
    star = SqlRunner.run(sql,values)
    @id = star[0]['id'].to_i
  end

  def update()
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stars WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM stars"
    result = SqlRunner.run(sql).first
    return result.map{ |star| Star.new(star)}
end

end
