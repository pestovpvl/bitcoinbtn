class AddSoldInfoToCoins < ActiveRecord::Migration[5.2]
  def change
    remove_column :coins, :is_it_sold, :boolean
  end
end
