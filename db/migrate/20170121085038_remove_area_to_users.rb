class RemoveAreaToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Area, :string
  end
end
