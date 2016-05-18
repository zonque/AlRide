namespace :AlRide do

  desc 'add fake entries'
  task add_fake_entries: :environment do |_t, _args|
    ActiveRecord::Base.transaction do
      UserMailer.delivery_method = :test

      100.times do
        e = Entry.create(entry_type: Entry::TYPES.shuffle.first,
                         name: Faker::Name.name,
                         email: Faker::Internet.email,
                         phone: Faker::PhoneNumber.cell_phone,
                         date: Faker::Time.forward(30),
                         from: Faker::Address.city,
                         to: Faker::Address.city,
                         seats: Faker::Number.between(1, 6),
                         notes: Faker::Hacker.say_something_smart)
        puts "Created entry \##{e.id}"
      end
    end
  end
end
