class AddStatusToProductSubsubcategories < ActiveRecord::Migration
  def change
    add_column :product_subsubcategories, :status, :string
  end
end
