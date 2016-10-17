
require_relative('../db/sql_runner')


class Customer

  attr_reader :id
  attr_accessor :name, :funds
  
  def initialize(name, funds)
    @name = name
    @funds = funds
    
    
  end

  def create
    sql = "INSERT INTO customers(name, funds) VALUES('#{@name}', #{@funds}) RETURNING *"
    customer =SqlRunner.run(sql).first
    @id = customer['id'].to_i
    puts "#{@name} was saved in the database!"
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE customers.id = #{@id}"
    SqlRunner.run(sql)
    puts "#{@name} was updated!"
  end

  def delete
    sql = "DELETE from customers where id = #{@id}"
    SqlRunner.run(sql)
    puts "Customer deleted!"
  end




end


