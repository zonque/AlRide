require 'rails_helper'

RSpec.describe Entry, type: :model do

  before(:each) do
    @attrs = {
      entry_type: "offer",
      name: "Bernardo Pacocha Jr.",
      email: "alia@hermannrenner.biz",
      phone: "(133) 320-3723",
      date: Time.now + 1.day,
      from: "New Kenna",
      to: "Port Madie",
      seats: 1,
      notes: "We need to parse the bus!",
    }
  end

  it "can be created" do
    expect(Entry.new(@attrs)).to be_valid
  end

  it "must have a locale set after creation" do
    entry = Entry.create!(@attrs)
    expect(entry.locale).to_not be(nil)
  end

  it "must have a secret set after creation" do
    entry = Entry.create!(@attrs)
    expect(entry.secret).to_not be(nil)
  end

  it "cannot be created with invalid email" do
    @attrs[:email] = "foo"
    expect(Entry.new(@attrs)).not_to be_valid
  end

  it "cannot be created with invalid type" do
    @attrs[:entry_type] = "foo"
    expect(Entry.new(@attrs)).not_to be_valid
  end

  it "cannot be created with date in the past" do
    @attrs[:date] = Time.now - 1.day
    expect(Entry.new(@attrs)).not_to be_valid
  end

end
