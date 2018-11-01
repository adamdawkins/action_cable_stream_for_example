class Comment < ApplicationRecord
  belongs_to :post
  after_commit { CommentsRelayJob.perform_later(self) }
end
