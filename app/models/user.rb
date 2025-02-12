class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true

  enum gender: { male: 1, female: 2, blank:0 }

  def self.looks(word)
    @user = User.where("name LIKE?", "%#{word}%")
  end

end
