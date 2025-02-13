class Product < ApplicationRecord
  belongs_to :category

  has_many :product_record_products, dependent: :destroy
  has_many :product_records, through: :product_record_products

  include ImageUploader::Attachment(:image)

  validates :name, presence: true
  validates :category_id, presence: true
  validates :kcals, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
