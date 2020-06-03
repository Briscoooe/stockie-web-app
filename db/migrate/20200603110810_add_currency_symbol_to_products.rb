class AddCurrencySymbolToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :currency_symbol, :string
  end
end
