class AddDriverToEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :driver, :boolean
  end
end
