class Dog 
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(name:, breed:, id: nil)
    @name = name 
    @breed = breed 
    @id = id 
  end 
  
  def self.create_table 
    sql = <<-SQL 
     CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY, 
      name TEXT,
      breed TEXT)
    SQL
    
    DB[:conn].execute(sql)
  end 
 
  def save
    if self.id 
      self.update 
    else
      sql = <<-SQL 
        INSERT INTO dogs (name, breed) VALUES (?,?)
      SQL
    
      DB[:conn].execute(sql, self.name, self.breed)
    #need to include self because it is the first time this instance is being saved  
    
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end 
    self 
    #returning the instance dog class
  end
  
  def self.create(name:, breed:)
    dog = self.new(name:name, breed:breed)
    dog.save 
    dog 
  end 
  
  def self.new_from_db(row)
    dog = self.new( 
     name:row[1],
     breed:row[2],
     id:row[0])
    dog
    #returns an array representing a dog's data [a,b,c]
    #right after you create the "copy" you need to lock it in the database- rows
    #extention of initialize, which is why you need the key/vals
  end 
  
  def self.find_by_id(id)
    sql = <<-SQL
      SELECT * FROM dogs
      WHERE id = ?
    SQL
      row = DB[:conn].execute(sql, id)[0]
      self.new_from_db(row)
  end 
  
  def self.find_or_create_by
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?
  end 
  
 
  
  def self.find_by_name
    
  end 
  
  def update 
    # if self.id 
    #   self.update 
    # else SELECT * FROM dogs WHERE (name, )
  end
  
  def self.drop_table 
    sql =  <<-SQL 
      DROP TABLE dogs
    SQL
    
    DB[:conn].execute(sql) 
    
      # DB[:conn].execute(DROP TABLE dogs)
    #here you do not have to include the SQL portion 
  end 
  
end 
