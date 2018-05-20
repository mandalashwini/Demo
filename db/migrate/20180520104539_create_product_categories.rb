class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
