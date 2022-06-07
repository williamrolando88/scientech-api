class Brand < ApplicationRecord
  belongs_to :lines
  has_many :products
end
