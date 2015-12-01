class AdminMailer < ActionMailer::Base
  default from: "bdcatpl@gmail.com"

  def send_mail(email)
    @email = email
    attachments[@email["image_file_file_name"].to_s] = File.read("#{Rails.root}/public/mail_images/#{@email['id'].to_s}/:image_file" )
    mail(:to => "actionumisphil@gmail.com", :subject => email["subject"])
  end
end
