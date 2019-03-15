class User < ApplicationRecord
    has_many :lessons, dependent: :destroy
    # accepts_nested_attributes_for :lessons
    has_many :categories, through: :lessons
    
    validates :name, presence: true, 
        length: {minimum: 3, maximum: 20}

    before_save { email.downcase! }
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
        length: {minimum: 3, maximum: 30},
        format: { with: EMAIL_REGEX },
        uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum:6 }, allow_nil: true


    has_many :active_relationships, class_name: "Relationship",
                foreign_key: 'follower_id', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed

    has_many :passive_relationships, class_name: "Relationship",
                foreign_key: 'followed_id', dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    def follow(other_user)
      following << other_user
    end
    def unfollow(other_user)
      following.delete(other_user)
    end
    def following?(other_user)
      following.include?(other_user)
    end

end
