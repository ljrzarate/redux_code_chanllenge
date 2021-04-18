class MentionMailerJob < ApplicationJob
  queue_as :default

  def perform(entity)
    MentionProcessorMailer.new(entity).process
  end
end
