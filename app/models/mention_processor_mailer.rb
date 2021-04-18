class MentionProcessorMailer
  def initialize(entity)
    @entity = entity
  end

  def process
    users.each do |user|
      MentionMailer.with(user: user, entity: @entity).
                        mention.
                        deliver_now
    end
  end

  private
  def users
    MentionProcessor.new.process_mentions(@entity)
  end
end
