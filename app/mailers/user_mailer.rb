class UserMailer < ActionMailer::Base
  default from: Settings['from_email']

  def entry_created(entry)
    @entry = entry
    mail to: @entry.email, subject: "#{Settings['platform_name']}: " + t('your_entry_has_been_created', type: @entry.entry_type)
  end

  def contact_entry_person(entry, from, text)
    @entry = entry
    @text = text
    @from = from
    mail to: @entry.email, reply_to: from, subject: "#{Settings.platform_name}: " + t('someone_contacted_you')
  end

end
