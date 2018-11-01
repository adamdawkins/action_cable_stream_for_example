class CommentsRelayJob < ApplicationJob
  queue_as :default

  def perform(comment)
    CommentsChannel.broadcast_to(
      comment.post,
      comment: CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
    )
  end
end
