class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.integer :product_id
      t.integer :category_id
      t.timestamps
    end

    add_index :product_categories, :product_id, :name => 'product_categories_on_product_id_index'
    add_index :product_categories, :category_id, :name => 'product_categories_on_category_id_index'
  end
end
