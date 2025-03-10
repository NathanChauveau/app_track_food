class MoveWeight < ActiveRecord::Migration[8.0]
  def change
    add_column :product_records, :weight, :decimal, precision: 5, scale: 2

    remove_column :users, :weight
  end
end
