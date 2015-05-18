json.array!(@entries) do |entry|
  json.extract! entry, :id, :entry_type, :name, :email, :phone, :date, :from, :to, :seats, :notes, :secret
  json.url entry_url(entry, format: :json)
end
