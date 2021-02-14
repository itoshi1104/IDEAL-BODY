class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true, length: { maximum: 50 }
end
