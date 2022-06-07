class Brand < ApplicationRecord
  belongs_to :lines, class_name: 'Line', foreign_key: :line_id
  has_many :products
end
