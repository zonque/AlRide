class UserMailer < ActionMailer::Base
  default from: Settings['from_email']

  def entry_created(entry)
    @entry = entry
    mail to: @entry.email, subject: "#{Settings['platform_name']}: your #{@entry.entry_type} has been created"
  end

  def contact_entry_person(entry, from, text)
    @entry = entry
    @text = text
    mail to: @entry.email, from: from, subject: "#{Settings['platform_name']}: someone sent you a message"
  end

end
