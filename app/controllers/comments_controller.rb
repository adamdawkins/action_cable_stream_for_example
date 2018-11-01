class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.create! body: params[:comment][:body], post: @post
    CommentsChannel.broadcast_to(@post, { comment: render_comment(@comment)})
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def render_comment(comment)
      render(partial: 'comment', locals: { comment: comment })
    end
end
