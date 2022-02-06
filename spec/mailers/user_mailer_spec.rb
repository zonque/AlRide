require "rails_helper"
require 'support/locale_helpers'

RSpec.describe UserMailer, type: :mailer do

  describe "entry_created" do
    it "delivers to the right recipient" do
      for_each_locale do
        entry = FactoryBot.create(:entry)
        mail = UserMailer.entry_created(entry)

        expect(mail.to).to eq([entry.email])
        expect(mail.subject).to include(Settings.platform_name)
      end
    end
  end

  describe "contact_entry_person" do
    it "delivers to the right recipient" do
      for_each_locale do
        entry = FactoryBot.create(:entry)
        mail = UserMailer.contact_entry_person(entry, "", "", false)

        expect(mail.to).to eq([entry.email])
        expect(mail.subject).to include(Settings.platform_name)
      end
    end
  end

end
