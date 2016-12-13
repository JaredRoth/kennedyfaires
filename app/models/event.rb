class Event < ApplicationRecord
  default_scope { order(date: :asc) }

  belongs_to :faire

  has_many :event_spaces
  has_many :applications
  has_many :space_businesses, through: :event_spaces, source: :business
  has_many :applied_businesses, through: :applications, source: :business

  validates :date,            presence: true
  validates :faire,           presence: true

  def title
    if alternate_title.blank?
      faire.title
    else
      alternate_title
    end
  end
end
