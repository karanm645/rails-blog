class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # the only ones we want ppl to look at
  before_action :set_blog_post, except: [:index, :new, :create]
  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show 
  end 

  def new
    @blog_post = BlogPost.new
  end 

  def create 
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post 
    else 
      render :new, status: :unprocessable_entity
    end 
  end 

  def edit
  end 

  def update 
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end 
  end 

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end 
  private
  
  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end 

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id]) # this is a ternary if statement --> : in middle is or, this is an if else statement in one line (refactored ;))
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path  
  end 
end 