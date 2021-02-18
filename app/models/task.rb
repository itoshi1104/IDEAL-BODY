class Task < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true,  length: { maximum: 50 }
  validates :body, length: { maximum: 100 }
end
