class CreateUsers < ActiveRecord::Migration
#This is a migration file. We can edit and create tables by migration.
#You can see the definition of the table at db/scheme.rb

  def change
    create_table :users do |t|
      t.string :name
      #:name => message_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      t.index :email, unique: true
      #email is unique
    end
  end
end
