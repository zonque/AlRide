class UserMailer < ActionMailer::Base
  default from: Settings['from_email']

  def entry_created(entry)
    @entry = entry
    mail to: @entry.email, subject: "#{Settings['platform_name']}: your #{@entry.entry_type} has been created"
  end

  def contact_entry_person(entry, from, text)
    @entry = entry
    @text = text
    @from = from
    mail to: @entry.email, reply_to: from, subject: "#{Settings.platform_name}: someone contacted you"
  end

end
