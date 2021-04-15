class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :post
  belongs_to :user

  def author
    self.user.username
  end
end
