class AddDriverToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :driver, :boolean
  end
end
