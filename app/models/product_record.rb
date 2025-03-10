class ProductRecord < ApplicationRecord
  belongs_to :user
  has_many :product_record_products, dependent: :destroy
  has_many :products, through: :product_record_products

  accepts_nested_attributes_for :product_record_products, allow_destroy: true

  validates :date, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
end
