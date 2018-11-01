class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.create! body: params[:comment][:body], post: @post
    CommentsChannel.broadcast_to(@post, @comment)
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
