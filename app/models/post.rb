class Post
  attr_accessor :id, :title, :body, :author, :created_at 

  def initialize(id, title, body, author, created_at)
    @id = id
    @title = title
    @body = body
    @author = author
    @created_at = created_at
  end

  def to_s
    "#{id}: #{title}"
  end

end
