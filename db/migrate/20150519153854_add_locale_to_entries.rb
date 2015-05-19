class AddLocaleToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :locale, :string, default: 'en'
  end
end
