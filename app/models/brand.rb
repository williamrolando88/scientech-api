class Brand < ApplicationRecord
  belongs_to :lines, class_name: 'Line', foreign_key: :line_id
  has_many :products, foreign_key: :brand_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
