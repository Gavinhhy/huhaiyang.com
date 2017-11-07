class WelcomeController < ApplicationController
  def index
  end

  def last_post
    @post  = Post.last
  end

end
