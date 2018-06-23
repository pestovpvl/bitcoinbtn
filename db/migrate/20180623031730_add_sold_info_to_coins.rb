class AddSoldInfoToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :cost_per_sold, :decimal
    add_column :coins, :is_it_sold, :boolean
  end
end
