class MentionMailer < ApplicationMailer
  def mention
    @user = params[:user]
    @comment = params[:comment]
    mail(to: @user.email, subject: 'You were mention in a comment - Redux Posts')
  end
end
