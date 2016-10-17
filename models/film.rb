
class Film

  attr_reader :id
  attr_accessor :title, :price
  
  def initialize(title, price)
  @title = title
  @price = price    
  end


  def create
    sql = "INSERT INTO films(title, price) VALUES('#{@title}', #{@price}) RETURNING *"
    film =SqlRunner.run(sql).first
    @id = film['id'].to_i
    puts "#{@title} was saved in the database!"
  end

  def update
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price})"
    SqlRunner.run(sql)
    puts "#{@title} was updated!"
  end

  def delete
    sql = "DELETE from films where id = #{@id}"
    SqlRunner.run(sql)
    puts "Film deleted!"
  end

  def all_viewers
    sql = "SELECT customers.name from customers JOIN tickets on (customers.id = tickets.customer_id) WHERE ( tickets.film_id = #{@id})"
    result =[]
    SqlRunner.run(sql).map{|row| result << row}
    return result
  end

end
