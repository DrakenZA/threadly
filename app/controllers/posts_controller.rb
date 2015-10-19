class PostsController < ApplicationController


  def index
    @new_posts = Post.new
    @all_posts = Post.order(created_at: :desc).all
  end


    def create
      @post = Post.new(params.require(:post).permit(:comment))
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end



end