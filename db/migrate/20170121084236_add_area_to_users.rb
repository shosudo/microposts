class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Area, :string
  end
end
