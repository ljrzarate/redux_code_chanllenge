class MentionProcessorMailer
  def initialize(comment)
    @comment = comment
  end

  def process
    users.each do |user|
      MentionMailer.with(user: user, comment: @comment).
                        mention.
                        deliver_now
    end
  end

  private
  def users
    MentionProcessor.new.process_mentions(@comment)
  end
end
