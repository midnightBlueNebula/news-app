class Article < ApplicationRecord
  belongs_to  :user
  belongs_to  :category
  has_many    :comments, dependent: :destroy
  has_many    :taggings
  has_many    :tags, through: :taggings, dependent: :destroy
end
