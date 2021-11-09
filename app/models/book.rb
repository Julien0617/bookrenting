class Book < ApplicationRecord
  scope :is_rental, -> {where(is_rental: true)}
  scope :is_not_rental, -> {where(is_rental: false)}

  belongs_to :user

  

  validates :name, 
            :author_name,
            :description,
            :gender, presence: true
end
