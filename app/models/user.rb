class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  
  has_many :following_users, through: :active_relationships, source: :following
  has_many :follower_users, through: :passive_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true

  enum gender: { male: 1, female: 2, blank:0 }

  def self.looks(word)
    @user = User.where("name LIKE?", "%#{word}%")
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def follow(user_id)
    active_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(following_id: user_id)&.destroy
  end

  def following?(user)
    following_users.include?(user)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.gender = "blank"
      user.height = "171"
      user.weight = "64"
    end
  end

end
