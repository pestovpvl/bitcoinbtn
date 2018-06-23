class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :symbol
      t.integer :person_id
      t.decimal :cost_per
      t.decimal :amount_owned

      t.timestamps
    end
    
    add_index :coins, :person_id
  end
end
