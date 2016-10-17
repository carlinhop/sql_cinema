require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')


`psql -d cinema -f db/cinema.sql`

cust1 = Customer.new("Carlos", 100)

cust1.create

film1 = Film.new("A nice film", 3)
film1.create

ticket1 = Ticket.new(cust1,film1)
ticket1.create

cust1.name = "Carlos A"
cust1.update

cust2 = Customer.new("Dalila", 20)
cust2.create

# ticket1.customer_id = cust2.id
# ticket1.update

cust3 = Customer.new("Karelia", 20)
cust3.create


film2 = Film.new("A good film", 2)
film2.create
film2.delete


puts cust1.funds
ticket2 = Ticket.new(cust1,film1)
ticket2.create
puts cust1.funds

puts Ticket.owned_by(cust1)

puts film1.all_viewers
