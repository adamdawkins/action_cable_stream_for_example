class CommentsChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params[:id])
    puts params
    puts post
    stream_for post
  end

  def unsubscribed
    stop_all_streams
  end
end
