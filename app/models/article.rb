class Article < ApplicationRecord
  belongs_to  :user
  belongs_to  :category
  has_many    :voting_articles, dependent: :destroy
  has_many    :comments, dependent: :destroy
  has_many    :taggings
  has_many    :tags, through: :taggings, dependent: :destroy
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true 
  validate :picture_size

  private

  def picture_size
    if picture.size > 20.megabytes
      errors.add(:picture, "size should be less than 20 megabytes.")
    end
  end
end
