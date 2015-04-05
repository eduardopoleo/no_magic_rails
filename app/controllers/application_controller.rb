class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def posts
    posts = []
    # The sqlite returns an array
    # Active Record pasrse the primitice data and wrap it into objects
    # Such objects have setters and getters
    
    db.execute('SELECT * from rost').each do |post|
      posts << Post.new(post[0], post[1], post[2], post[3], post[4])
    end
    render 'application/posts', locals: {
     posts: posts 
     }
  end

  def show_post
    result = db.execute("SELECT * FROM rost WHERE id = ? LIMIT 1", params[:id]).flatten
    post = Post.new(result[0], result[1], result[2], result[3], result[4])
    render 'application/show_post', locals: {
      post: post 
     }
  end

  def new_post
    render 'application/new_post'
  end

  private

  def db
    SQLite3::Database.new 'db/development.sqlite3'
  end
end
