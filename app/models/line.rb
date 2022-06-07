class Line < ApplicationRecord
  has_many :brands, foreign_key: :line_id, dependent: :destroy
end
