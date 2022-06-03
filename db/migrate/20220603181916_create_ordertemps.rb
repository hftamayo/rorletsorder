class CreateOrdertemps < ActiveRecord::Migration[6.1]
  def change
    create_table :ordertemps do |t|
      t.integer :amount
      t.integer :mealid
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
