class AddStatusToProductSubcategories < ActiveRecord::Migration
  def change
    add_column :product_subcategories, :status, :string
  end
end
