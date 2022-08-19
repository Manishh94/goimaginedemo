class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :vendor, optional: true
end
