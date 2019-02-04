require_relative("customer")
require_relative("../db/sqlrunner")
require_relative("ticket")
require_relative("screening")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET(title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def delete()
    sql = "DELETE * FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = $1 "
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def no_of_customers_per_film()
    customers = self.customers()
    no_of_customers = customers.length.to_i
    return no_of_customers
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end



end
