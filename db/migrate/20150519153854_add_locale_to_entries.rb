class AddLocaleToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :locale, :string, default: 'en'
  end
end
