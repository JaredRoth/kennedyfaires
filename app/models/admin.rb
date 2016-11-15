class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  has_many :events
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable
end
