class UserMailer < ActionMailer::Base
  default from: ENV['ALRIDE_FROM_EMAIL']

  def entry_created(entry)
    @entry = entry

    I18n.with_locale(@entry.locale) do
      mail to: @entry.email, subject: "#{ENV['ALRIDE_PLATFORM_NAME']}: " + t("your_#{@entry.entry_type}_has_been_created")
    end
  end

  def contact_entry_person(entry, from, text, would_drive)
    @entry = entry
    @text = text
    @from = from
    @would_drive = would_drive

    I18n.with_locale(@entry.locale) do
      mail to: @entry.email, reply_to: from, subject: "#{ENV['ALRIDE_PLATFORM_NAME']}: " + t('someone_contacted_you')
    end
  end

end
