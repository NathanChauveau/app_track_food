class AddImagePath < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :image_data, :string
  end
end
