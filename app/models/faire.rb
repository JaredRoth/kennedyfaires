class Faire < ApplicationRecord
  belongs_to :city
  belongs_to :user

  has_many :events

  validates :title,       presence: true
  validates :description, presence: true
  validates :city,        presence: true
  validates :user,        presence: true
end
