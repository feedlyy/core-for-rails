class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :nama
      t.integer :jumlah
      t.timestamps
    end
  end
end
