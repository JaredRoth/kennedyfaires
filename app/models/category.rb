class Category < ApplicationRecord
  has_many :vendor_categories
  has_many :vendors, through: :vendor_categories
end
