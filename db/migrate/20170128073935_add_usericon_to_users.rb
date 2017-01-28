class AddUsericonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usericon, :string
  end
end
