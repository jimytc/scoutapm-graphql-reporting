class Author
  attr_accessor :name, :age

  def initialize(name)
    @name = name
    @age = Random.rand(18..50)
  end
end