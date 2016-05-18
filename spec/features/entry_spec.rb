require 'rails_helper'
require 'support/locale_helpers'
require 'support/mail_helpers'

feature 'Requests', type: :feature do

  scenario "user submits a new entry" do
    Entry::TYPES.each do |entry_type|
      for_each_locale do
        entry = FactoryGirl.build(:entry)
        entry.entry_type = entry_type
        reset_email

        visit new_entry_path(entry_type: entry_type)

        fill_in "entry[name]", with: entry.name
        fill_in "entry[email]", with: entry.email
        fill_in "entry[phone]", with: entry.phone
        fill_in "entry[from]", with: entry.from
        fill_in "entry[to]", with: entry.to
        fill_in "entry[seats]", with: entry.seats

        click_button I18n.t('create_entry')

        fill_in "entry[date]", with: entry.date
        click_button I18n.t('create_entry')

        expect(current_path).to eq(root_path)
        expect(page).to have_content(I18n.t('entry_was_successfully_created'))
        expect(page).to have_content(entry.name)
        expect(page).to have_content(entry.from)
        expect(page).to have_content(entry.to)

        expect(last_email.to).to eq([entry.email])
        expect(last_email.from).to eq([Settings.mail.from])

        # use the link in the mail to delete the entry
        path_regex = /(https?\:\/\/.*?)(\/.*?)\n/
        path = last_email.body.match(path_regex)[2]
        expect(path).to_not be_empty
        visit(path)

        expect(Entry.where(email: entry.email)).to be_empty
      end
    end
  end

  scenario "User replies to an entry" do
    Entry::TYPES.each do |entry_type|
      for_each_locale do
        entry = FactoryGirl.create(:entry)
        entry.update_attribute(:entry_type, entry_type)
        visit entry_path(entry)
        reset_email

        from = "from@other.com"
        text = "hi there, blah"

        fill_in "from", with: from
        fill_in "text", with: text

        click_button I18n.t('send_email')

        expect(current_path).to eq(root_path)

        expect(last_email.to).to eq([entry.email])
        expect(last_email.reply_to).to eq([from])
        expect(last_email.body).to include(text)
      end
    end
  end

  scenario "remove links" do
    Entry::TYPES.each do |entry_type|
      for_each_locale do
        entry = FactoryGirl.create(:entry)
        entry.update_attribute(:entry_type, entry_type)

        # bogus ID
        visit entry_remove_path(entry_id: 0)
        expect(Entry.where(id: entry.id)).not_to be_empty

        # no secret
        visit entry_remove_path(entry_id: entry.id)
        expect(Entry.where(id: entry.id)).not_to be_empty

        # wrong secret
        visit entry_remove_path(entry_id: entry.id, secret: "wrong")
        expect(Entry.where(id: entry.id)).not_to be_empty

        # wrong secret
        visit entry_remove_path(entry_id: entry.id, secret: entry.secret)
        expect(Entry.where(id: entry.id)).to be_empty
      end
    end
  end
end
