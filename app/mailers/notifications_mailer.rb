class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@whodini.com"
  default :to => "tim@whodini.com"

  def new_message(message)
    @message = message
    mail(:subject => "[whodini.com] #{message.subject}")
  end
end
