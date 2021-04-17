class MentionMailerJob < ApplicationJob
  queue_as :default

  def perform(comment)
    MentionProcessorMailer.new(comment).process
  end
end
