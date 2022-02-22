class Product < ApplicationRecord
    validates :product_name, length: { minimum: 2, maximum: 50 }, presence: true
    validates :product_description, length: { minimum: 2, maximum: 240 }, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
end
