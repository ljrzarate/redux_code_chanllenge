class MentionMailerJob < ApplicationJob
  queue_as :default

  def perform(user, comment)
    MentionMailer.with(user: user, comment: comment).
                  mention.
                  deliver_now
  end
end
