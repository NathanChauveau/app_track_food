class CreateProductRecordProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :product_record_products do |t|
      t.references :product_record, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
