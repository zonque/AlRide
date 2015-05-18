class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :entry_type
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :date
      t.string :from
      t.string :to
      t.integer :seats
      t.text :notes
      t.string :secret

      t.timestamps
    end
  end
end
