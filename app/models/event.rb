class Event < ApplicationRecord
  belongs_to :faire

  has_many :event_spaces
  has_many :applications
  has_many :space_businesses, through: :event_spaces, source: :business
  has_many :applied_businesses, through: :applications, source: :business
end
