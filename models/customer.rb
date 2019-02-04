require_relative("film")
require_relative("../db/sqlrunner")
require_relative("ticket")
require_relative("screening")


class Customer

  attr_reader :id
  attr_accessor :name, :fund

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @fund = options['fund']
  end

  def save()
    sql = "INSERT INTO customers (name, fund) VALUES ($1, $2) RETURNING id"
    values = [@name, @fund]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET(name, fund) = ($1, $2) WHERE id = $3"
    values = [@name, @fund]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map{ |customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    tickets_data = SqlRunner.run(sql, values)
    tickets = tickets_data.map{|ticket| Ticket.new(ticket)}
    return tickets
  end

  def no_of_tickets_bought()
    tickets = self.tickets()
    no_of_tickets = tickets.length.to_i
    return no_of_tickets
  end

  def customer_decreasing_fund()
    films = self.films()
    films_cost = films.map{|films| films.price }
    total_film_price = films_cost.sum
    customer_fund = @fund - total_film_price
    customer.update(customer_fund)
  end

end
