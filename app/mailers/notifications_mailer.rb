class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@whodini.com"
  default :to => "info@whodini.com"

  def new_message(message)
    @message = message
    # mail(:subject => "[whodini.com] #{message.subject}")
    mail(:subject => "[whodini.com] Whodini Contact Page Message")
  end
end
