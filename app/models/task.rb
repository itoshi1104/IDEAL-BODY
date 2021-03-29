class Task < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true,  length: { maximum: 50 }
  validates :body, presence: true,  length: { maximum: 100 }
  validate :start_finish_check
  
  def start_finish_check
    if start_date > end_date
      errors.add(:finish_time, "が開始日時より前の日付では登録できません。")
    end
  end
  
end
