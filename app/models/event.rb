class Event < ApplicationRecord
  belongs_to :city
  belongs_to :admin

  has_many :event_spaces
  has_many :applications
  has_many :space_vendors, through: :event_spaces, source: :vendor
  has_many :applied_vendors, through: :applications, source: :vendor
end
