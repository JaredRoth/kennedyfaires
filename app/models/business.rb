class Business < ApplicationRecord
  belongs_to :vendor, foreign_key: 'user_id'
  has_many :business_categories
  has_many :categories, through: :business_categories
  has_many :event_spaces
  has_many :applications
  has_many :accepted_events, through: :event_spaces, source: :event
  has_many :applied_events, through: :applications, source: :event
end
