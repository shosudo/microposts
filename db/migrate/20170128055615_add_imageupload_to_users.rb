class AddImageuploadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :imageupload, :string
  end
end
