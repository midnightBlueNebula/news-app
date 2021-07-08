class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :voting_comments, dependend: :destroy
end
