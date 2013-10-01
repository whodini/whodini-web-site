class TryMailer < ActionMailer::Base
  default :from => "noreply@whodini.com"
  default :to => "tim@whodini.com"

  def new_message(message)
    @message = message
    # mail(:subject => "[whodini.com] #{message.subject}")
    mail(:subject => "[whodini.com] Try Whodini Message")
  end
end
