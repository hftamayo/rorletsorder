class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :itemamount
      t.string :clientrequest
      t.belongs_to :clients, null: false, foreign_key: true
      t.belongs_to :meals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
