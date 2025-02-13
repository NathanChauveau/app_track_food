class ProductRecordProduct < ApplicationRecord
  belongs_to :product_record
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
