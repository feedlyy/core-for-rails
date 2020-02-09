class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.text :password_digest
      t.text :password_confirmation
      t.timestamps
    end
  end
end
