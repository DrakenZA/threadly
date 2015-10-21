class PostsController < ApplicationController
=begin before_action :require_user, only: [:index, :show]
=end
skip_before_filter :verify_authenticity_token

  def destroy
    @dpost = Post.find_by id: params[:id]
    @dpostid = @dpost.id
    @dpost.destroy



    respond_to do |format|

    format.js
    format.html {redirect_to :action => 'index'}
  end



  end



  def index
    @new_posts = Post.new
    @all_posts = Post.order(created_at: :desc).all
  end


    def create
      @post = Post.new(params.require(:post).permit(:comment,:owner))
      @post.save!
      respond_to do |format|
        format.js
        format.html { redirect_to '/posts' }
          # render posts/create.js.erb
      end
    end



end
