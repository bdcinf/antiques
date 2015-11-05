class CreateProductSubcategories < ActiveRecord::Migration
  def change
    create_table :product_subcategories do |t|
    	t.integer :product_category_id
    	t.string :name, :limit => 255
    	t.attachment :img_file
    	t.text :description
      t.timestamps
    end
  end
end
