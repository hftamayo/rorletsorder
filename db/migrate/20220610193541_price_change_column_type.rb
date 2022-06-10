class PriceChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column(:ordertemps, :price, :string)
  end
end
