class MentionProcessorMailer
  def initialize(comment)
    @comment = comment
  end

  def process
    users.each do |user|
      MentionMailerJob.perfom_later(user, @comment)
    end
  end

  private
  def users
    MentionProcessor.new.process_mentions(@comment)
  end
end
