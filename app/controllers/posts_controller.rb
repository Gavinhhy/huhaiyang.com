class PostsController < ApplicationController

  #简单加密一下，防止被人篡改
  http_basic_authenticate_with name: "821222837@qq.com", password: "huhaiyang361010", except: [:index, :show ,:posts_in_2017 ,:posts_in_2016 ,:posts_in_2015 ,:posts_in_2014 ]

  layout 'posts_index'

  def index
    #@posts = Post.order('updated_at DESC')
    @posts = Post.order('updated_at DESC').page(params[:page]).per(10)
  end

  def posts_in_2017
    @posts = Post.created_in(2017).order('updated_at DESC').page(params[:page]).per(10)
  end

  def posts_in_2016
    @posts = Post.created_in(2016).order('updated_at DESC').page(params[:page]).per(10)
  end

  def posts_in_2015
    @posts = Post.created_in(2015).order('updated_at DESC').page(params[:page]).per(10)
  end

  def posts_in_2014
    @posts = Post.created_in(2014).order('updated_at DESC').page(params[:page]).per(10)
  end
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "The article has been successfully created."
    else
      render 'new'
    end
  end

  def show
    @post= Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def last_post
    @post = Post.last
  end


  private
  def post_params
    params.require(:post).permit(:title,:content)
  end


end
