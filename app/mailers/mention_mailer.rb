class MentionMailer < ApplicationMailer
  def mention
    @user = params[:user]
    @entity = params[:entity]
    mail(to: @user.email, subject: 'You were mention in a entity - Redux Posts')
  end
end
