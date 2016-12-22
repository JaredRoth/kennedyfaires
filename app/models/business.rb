class Business < ApplicationRecord
  belongs_to :vendor, foreign_key: 'user_id'
  has_many :business_categories
  has_many :categories, through: :business_categories
  has_many :event_spaces
  has_many :applications
  has_many :accepted_events, through: :event_spaces, source: :event
  has_many :applied_events, through: :applications, source: :event

  validates :business_name,       uniqueness: { scope: :vendor }
  validates :business_name,       presence: true
  validates :product_description, presence: true
  validates :street_address,      presence: true
  validates :city,                presence: true
  validates :state,               presence: true
  validates :zip,                 presence: true
  validates :vendor,              presence: true
end
