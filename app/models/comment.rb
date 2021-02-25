class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :notifications, dependent: :destroy
  validates :body, presence: true, length: { maximum: 50 }
  
end
