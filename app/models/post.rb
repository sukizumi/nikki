class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :user_id, message: "この日付の投稿は既に存在します。" }
  validates :weight, presence: true
  validates :step, presence: true
  validates :food, presence: true
  validates :text, presence: true

  enum food: { bad: 0, normal: 1, good:2 }

  def self.looks(word)
    @post = Post.where("text LIKE?", "%#{word}%")
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  scope :from_followed_users, ->(user) {
    where(user_id: user.following_users.select(:id))
  }

  def bmi
    (weight.to_f / (user.height.to_f * user.height.to_f * 0.0001)).round(2)
  end
  
end
