class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :amount, presence: true
end
