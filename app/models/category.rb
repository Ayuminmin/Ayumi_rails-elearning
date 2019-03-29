class Category < ApplicationRecord
    has_many :words, dependent: :destroy
    has_many :lessons, dependent: :destroy
    has_many :users, through: :lessons
    has_many :answers, through: :lessons
    has_many :choices, through: :words

    validates :title, presence: true
    validates :description, presence: true,
                length: {maximum: 100} 
end
