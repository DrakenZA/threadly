class PostsController < ApplicationController
=begin before_action :require_user, only: [:index, :show]
=end

  def destroy
    @dpost = Post.find_by id: params[:id]
    @dpost.destroy
    redirect_to :action => 'index'
  end

  def index
    @new_posts = Post.new
    @all_posts = Post.order(created_at: :desc).all
  end


    def create
      @post = Post.new(params.require(:post).permit(:comment))
      @post.owner = current_user.username
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end


  end



end
