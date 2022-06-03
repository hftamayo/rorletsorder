class CreateClientaddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :clientaddresses do |t|
      t.string :street
      t.string :city
      t.string :houseid
      t.string :addcomplement
      t.belongs_to :clients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
