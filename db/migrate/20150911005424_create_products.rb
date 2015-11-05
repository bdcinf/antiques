class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer :product_category_id
    	t.integer :product_subcategory_id
      t.integer :product_subsubcategory_id
      t.string :product_var_id
    	t.string :name, :limit => 255
    	t.decimal :price, :precision => 15, :scale => 2
    	t.text :description
    	t.attachment :img_file
      t.string :status
      t.timestamps
    end
  end
end
