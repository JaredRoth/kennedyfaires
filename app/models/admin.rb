class Admin < User
  has_many :faires, foreign_key: 'user_id'
  has_many :events, through: :faires
end
