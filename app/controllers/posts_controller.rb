class PostsController < ApplicationController
    layout  'posts_index'
  def index
    @posts = Post.all
  end
end
