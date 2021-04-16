class MentionMailer < ApplicationMailer
  def mention(user, comment)
    @user = user
    @comment = comment
    mail(to: user.email, subject: 'You were mention in a comment - Redux Posts')
  end
end
