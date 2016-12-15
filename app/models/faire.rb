class Faire < ApplicationRecord
  belongs_to :city
  belongs_to :admin, foreign_key: 'user_id'

  has_many :events

  validates :title,       presence: true
  validates :description, presence: true
  validates :city,        presence: true
  validates :admin,       presence: true

  def full_title
    "#{city.name} #{title}"
  end
end
