require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")
require_relative("models/screening")

require('pry')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()

customer1 = Customer.new({'name' => 'Chika', 'fund'=> 500})
customer1.save()
customer2 = Customer.new({'name' => 'Odogwu', 'fund'=> 350})
customer2.save()
customer3 = Customer.new({'name' => 'Chyke', 'fund'=> 200})
customer3.save()
customer4 = Customer.new({'name' => 'Okon', 'fund'=> 5})
customer4.save()
customer5 = Customer.new({'name' => 'Ify', 'fund'=> 900})
customer5.save()


film1 = Film.new({'title' => 'Living in bondage', 'price' => 10, })
film1.save()
film2 = Film.new({'title' => 'Rattle Snake', 'price' => 6})
film2.save()
film3 = Film.new({'title' => 'Village Headmaster', 'price' => 7})
film3.save()
film4 = Film.new({'title' => 'Honeymoon', 'price' => 10})
film4.save()
film5 = Film.new({'title' => 'Died Wretched', 'price' => 10})
film5.save()
film6 = Film.new({'title' => 'The Governor', 'price'=> 11})
film6.save()
film7 = Film.new({'title' => 'Mr. President', 'price' => 6})
film7.save()
film8 = Film.new({'title' => 'Affluence of Plenty', 'price' => 5})
film8.save()
film9 = Film.new({'title' => 'Rescucitated', 'price' => 7})
film9.save()
film10 = Film.new({'title' => 'Coming to Reality', 'price' => 7})
film10.save()
film11 = Film.new({'title' => 'Lekki Wives', 'price' => 9})
film11.save()


screening1 = Screening.new({'screening_time' => '13:00'})
screening1.save()
screening2 = Screening.new({'screening_time' => '14:00'})
screening2.save()
screening3 = Screening.new({'screening_time' => '15:00'})
screening3.save()
screening4 = Screening.new({'screening_time' => '16:00'})
screening4.save()
screening5 = Screening.new({'screening_time' => '17:00'})
screening5.save()
screening6 = Screening.new({'screening_time' => '18:00'})
screening6.save()
screening7 = Screening.new({'screening_time' => '19:00'})
screening7.save()
screening8 = Screening.new({'screening_time' => '20:00'})
screening8.save()
screening9 = Screening.new({'screening_time' => '21:00'})
screening9.save()
screening10 = Screening.new({'screening_time' => '22:00'})
screening10.save()
screening11 = Screening.new({'screening_time' => '23:00'})
screening11.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id, 'screening_id' => screening1.id })
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film6.id, 'screening_id' => screening2.id })
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id, 'screening_id' => screening3.id })
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id, 'screening_id' => screening4.id })
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id, 'screening_id' => screening5.id })
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film7.id, 'screening_id' => screening6.id })
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film8.id, 'screening_id' => screening7.id })
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film9.id, 'screening_id' => screening8.id })
ticket8.save()
ticket9 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film8.id, 'screening_id' => screening9.id })
ticket9.save()
ticket10 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film10.id, 'screening_id' => screening10.id })
ticket10.save()
ticket11 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film11.id, 'screening_id' => screening11.id })
ticket11.save()
ticket12 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film11.id, 'screening_id' => screening12.id })
ticket12.save()

binding.pry
nil
