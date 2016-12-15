class Vendor < User
  has_many :businesses, foreign_key: 'user_id'
end
