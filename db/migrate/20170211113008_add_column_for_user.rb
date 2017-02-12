class AddColumnForUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username,:string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :ip ,:string
    add_reference :short_links, :user, index:true
  end
end
