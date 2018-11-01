class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.create! body: params[:comment][:body], post: @post
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
