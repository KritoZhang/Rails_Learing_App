class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
  validate :picture_size

  default_scope -> { order(created_at: :desc)}
  mount_uploader :picture, PictureUploader

# 验证上传的图片大小
  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
