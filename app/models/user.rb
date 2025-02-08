class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, uniqueness: true

  enum gender: { male: 1, female: 2, blank:0 }

  def BMI_calculation
    latest_post = posts.last
    return nil unless lastest_post&.weight && height

    latest_post.weight.to_f / ((height.to_f / 100) ** 2)
  end

  def BMI_rate
    return "データ不足" unless BMI_calculation

    case BMI_calculation
    when 0..18.5
      "低体重"
    when 18.5..24.9
      "普通体重"
    when 25..29.9
      "肥満(1度)"
    when 30..34.9
      "肥満(2度)"
    when 35..39.9
      "肥満(3度)"
    else
      "肥満(4度)"
    end
  end

end
