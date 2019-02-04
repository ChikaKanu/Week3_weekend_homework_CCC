require_relative("film")
require_relative("../db/sqlrunner")
require_relative("customer")
require_relative("ticket")

class Screening

  attr_accessor :screening_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screening_time = options['screening_time']
  end

  def save()
    sql = "INSERT INTO screenings (screening_time) VALUES ($1) RETURNING id"
    values = [@screening_time]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET(screening_time) = ($1) WHERE id = $2"
    values = [@screening_time]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| Screening.new(screening)}
  end

  def delete()
    sql = "DELETE * FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


end
