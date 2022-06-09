class AddUserFieldsToOrdersTmp < ActiveRecord::Migration[6.1]
  def change
    add_column :ordertemps, :clientName, :string
    add_column :ordertemps, :clientId, :string
  end
end
