class UserMailer < ActionMailer::Base
  default from: "noreply@nodomain.org"

  def entry_created(entry)
    @entry = entry
    mail to: @entry.email, subject: "AlRide: your request has been created"
  end

  def contact_entry_person(entry, from, text)
    @entry = entry
    @text = text
    mail to: @entry.email, from: from, subject: "AlRide: someone sent you a message"
  end

end
