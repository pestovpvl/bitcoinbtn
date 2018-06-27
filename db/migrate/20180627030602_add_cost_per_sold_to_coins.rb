class AddCostPerSoldToCoins < ActiveRecord::Migration[5.2]
  def change
      add_column :coins, :cost_per_sold, :decimal
  end
end
