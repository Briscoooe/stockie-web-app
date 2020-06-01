class AddVariantNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :variant_name, :string
  end
end
