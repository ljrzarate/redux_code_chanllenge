class Post < ApplicationRecord
  act_as_mentioner
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked?(by_user)
    self.likes.where(user: by_user).any?
  end
end
