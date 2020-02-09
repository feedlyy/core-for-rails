class AddUserTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_token, :text
  end
end
