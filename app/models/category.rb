class Category < ApplicationRecord
  has_many :business_categories
  has_many :businesses, through: :business_categories
end
