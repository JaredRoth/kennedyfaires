class Vendor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :vendor_categories
  has_many :categories, through: :vendor_categories
  has_many :event_spaces
  has_many :applications
  has_many :accepted_events, through: :event_spaces, source: :event
  has_many :applied_events, through: :applications, source: :event

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable
end
