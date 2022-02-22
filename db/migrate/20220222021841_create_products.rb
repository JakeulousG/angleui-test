class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
