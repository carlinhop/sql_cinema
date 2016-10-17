require_relative('customer')

class Ticket 

  attr_reader  :id
  attr_accessor :customer_id, :film_id
  
  def initialize(customer, film)
  @customer_id = customer.id
  @film_id = film.id
  customer.funds -= film.price 
  customer.update   
  end

  def create
    sql = "INSERT INTO tickets(customer_id, film_id) VALUES('#{@customer_id}', #{@film_id}) RETURNING *"
    film =SqlRunner.run(sql).first
    @id = film['id'].to_i

    puts "Ticket: #{@id} was saved in the database!"
  end

  def update
    sql = "UPDATE tickets SET (customer_id, film_id) = (#{@customer_id}, #{@film_id})"
    SqlRunner.run(sql)
    puts "Ticket #{@id} was updated!"
  end

  def delete
    sql = "DELETE from tickets where id = #{@id}"
    SqlRunner.run(sql)
    puts "Ticket deleted!"
  end

  def self.owned_by(customer)
    sql = "SELECT tickets.id, films.title FROM tickets JOIN films ON (film_id = films.id) WHERE (#{customer.id} = tickets.customer_id) "
    result = []
    SqlRunner.run(sql).map{|row| result << row}
    return result    
    
  end

end
