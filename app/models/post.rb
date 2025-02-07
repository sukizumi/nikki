class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :date, presence: true
  validates :weight, presence: true
  validates :step, presence: true
  validates :food, presence: true
  validates :text, presence: true

  enum food: { bad: 0, normal: 1, good:2 }

end
