class Product < ApplicationRecord
  belongs_to :brand, class_name: 'Brand', foreign_key: :brand_id

  validates :name, presence: true, length: { maximum: 50 }

  has_one_attached :image
end
