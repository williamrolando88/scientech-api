class Line < ApplicationRecord
  has_many :brands, foreign_key: :line_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
