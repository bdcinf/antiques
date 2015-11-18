class AdminMailer < ActionMailer::Base
  default from: "bdcatpl@gmail.com"

  def send_mail(user)
    @user = user
    mail(:to => "info@actionumisphil.com", :subject => user["subject"])
  end
end
