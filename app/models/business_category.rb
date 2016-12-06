class BusinessCategory < ApplicationRecord
  belongs_to :business
  belongs_to :category
end
