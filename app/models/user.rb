class User < ApplicationRecord
    attr_accessor :remember_token

    has_secure_password

    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_many :follower_in_relationships, class_name: "Relationship",
                                        foreign_key: "follower_id",
                                          dependent: :destroy

    has_many :followed_in_relationships, class_name: "Relationship",
                                        foreign_key: "followed_author_id",
                                          dependent: :destroy

    has_many :followed_authors, through: :follower_in_relationships
    has_many :followers, through: :followed_in_relationships

    has_many :voting_articles
    has_many :voting_comments
    



    
    class << self
    
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost                                                          
            BCrypt::Password.create(string, cost: cost)
        end

        def new_token
            SecureRandom.urlsafe_base64
        end

    end

    def remember 
        @remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
end
