class Admin < ApplicationRecord
  validates :first_name, 
            :last_name,
            :email,
            :phone,
            :city,
            :town, presence: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

has_secure_password
end
