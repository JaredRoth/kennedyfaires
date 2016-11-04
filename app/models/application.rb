class Application < ApplicationRecord
  belongs_to :vendor
  belongs_to :event

  enum status: [
    received: 0,
    confirmed: 1,
    rejected: 2
  ]
end
