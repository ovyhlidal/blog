class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  require 'mandrill'

  def mandrill_client
    @mandrill = Mandrill::API.new "APIKEY"
  end

  def my_email_method(user)
    template_name = "my-email-method"
    template_content = []
    message = {
        to: [{email: user.name}],
        subject: "Subject message",
        merge_vars: [
            {
                rcpt: @user.email,
                vars: [
                    {name: "USER_NAME", content: user.name},
                    {name: "LOG_IN_URL", content: root_url}
                ]
            }
        ]
    }
    mandrill_client.messages.send_template template_name, template_content, message
  end
end
