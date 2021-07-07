class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed_author, class_name: "User"
end
