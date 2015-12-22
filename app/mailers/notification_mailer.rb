class NotificationMailer < ApplicationMailer
  default (:from => "test@test.com", :to=>"skodik.o@gmail.com")

  def notification_mailer(notification)
    @notification = notification
    @url  = "http://postbox.tut/"
    mail(:subject => "New Notification")
  end

end
