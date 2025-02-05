class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  enum food: { bad: 0, normal: 1, good:2 }

end
