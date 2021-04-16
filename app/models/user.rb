class User < ApplicationRecord
  act_as_mentionee

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :avatar_format
  validates :username, { presence: true, uniqueness: true }

  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  def resize_image
      resized_image = MiniMagick::Image.read(avatar.download)
      resized_image = resized_image.resize "400x400"
      v_filename = avatar.filename
      v_content_type = avatar.content_type
      avatar.purge
      avatar.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  end

  def avatar_format
   return unless avatar.attached?
   if avatar.blob.content_type.start_with? 'image/'
     if avatar.blob.byte_size > 5.megabytes
       errors.add(:avatar, 'size needs to be less than 5MB')
       avatar.purge
     else
       resize_image
     end
    else
      avatar.purge
      errors.add(:avatar, 'needs to be an image')
    end
  end
end
