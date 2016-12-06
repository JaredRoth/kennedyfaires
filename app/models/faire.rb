class Faire < ApplicationRecord
  belongs_to :city
  belongs_to :user

  has_many :events
end
