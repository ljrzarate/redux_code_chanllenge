class MentionProcessor < MentionSystem::MentionProcessor
  def extract_mentioner_content(comment)
    comment.content
  end

  def find_mentionees_by_handles(*handles)
    User.where(username: handles)
  end
end
