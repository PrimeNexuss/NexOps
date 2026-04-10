class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  
  validates :user_id, uniqueness: { scope: :role_id, message: "User already has this role" }
end
