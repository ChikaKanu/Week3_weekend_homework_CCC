require_relative("film")
require_relative("../db/sqlrunner")
require_relative("customer")
require_relative("screening")

class Ticket

  attr_accessor :customer_id, :film_id, :screening_time_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @screening_time_id = options['screening_time_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_time_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@customer_id, @film_id, @screening_time_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET(customer_id, film_id, screening_time_id) = ($1, $2, $3) WHERE id = $4"
    values = [@customer_id, @film_id, @screening_time_id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM ticket"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def delete()
    sql = "DELETE * FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    return Film.new(film)
  end

  def screening()
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [@screening_time_id]
    screening = SqlRunner.run(sql, values).first
    return Film.new(screening)
  end


end
