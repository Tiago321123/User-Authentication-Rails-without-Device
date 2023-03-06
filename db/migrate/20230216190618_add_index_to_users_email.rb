class AddIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_column :users_emails, :email, :string
    add_index :users_emails, :email
  end
end
