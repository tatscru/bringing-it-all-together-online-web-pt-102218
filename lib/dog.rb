class Dog 
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(name, breed, id = nil)
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
    
    DB[:conn].excecute(sql)
  end 
  
  def self.drop_table 
    
  end 
  
  def save
  end 
  
  def self.create
  end 
  
  def self.find_by_id
  end 
  
  def self.find_or_create_by
  end 
  
  def self.new_from_db
  end 
  
  def self.find_by_name
  end 
  
  def update 
  end 
end 
