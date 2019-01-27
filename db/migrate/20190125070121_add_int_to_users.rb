class AddIntToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :int, :text
  end
end
