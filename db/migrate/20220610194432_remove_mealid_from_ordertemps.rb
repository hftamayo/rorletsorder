class RemoveMealidFromOrdertemps < ActiveRecord::Migration[6.1]
  def change
    remove_column :ordertemps, :mealid, :integer
  end
end
