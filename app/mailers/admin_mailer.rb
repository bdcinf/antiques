class AdminMailer < ActionMailer::Base
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  default from: "bdcatpl@gmail.com"

  def send_mail(email)
    @email = email
    if @email["image_file_file_name"] != nil
    	attachments[@email["image_file_file_name"].to_s] = File.read("#{Rails.root}/public/mail_images/#{@email['id'].to_s}/:image_file" )
    end
    mail(:to => "actionumisphil@gmail.com", :subject => email["subject"])
  end
end
