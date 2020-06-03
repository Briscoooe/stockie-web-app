class CreateAddCurrencyToProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :add_currency_to_products do |t|
      t.string :currency

      t.timestamps
    end
  end
end
