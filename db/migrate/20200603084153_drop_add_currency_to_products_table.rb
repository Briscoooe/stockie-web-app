class DropAddCurrencyToProductsTable < ActiveRecord::Migration[6.0]
  def change
      drop_table :add_currency_to_products
  end
end
