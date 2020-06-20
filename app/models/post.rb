class Post
  attr_accessor :title, :rating

  def initialize(title)
    @title = title
    @rating = Random.rand(1..5)
  end
end