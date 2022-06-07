class Product < ApplicationRecord
  belongs_to :brand, class_name: 'Brand', foreign_key: :brand_id
end
