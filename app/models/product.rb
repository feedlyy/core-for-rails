class Product < ApplicationRecord
  validates :nama, presence: true,
            length: { minimum: 5 }
  validates :jumlah, numericality: true
end
