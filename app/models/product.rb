class Product < ApplicationRecord
    has_many :product_categories, dependent: :destroy
    validates :product_name, presence: true
end
