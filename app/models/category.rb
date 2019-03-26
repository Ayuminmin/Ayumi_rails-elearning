class Category < ApplicationRecord
    has_many :words, dependent: :destroy
    has_many :lessons, dependent: :destroy
    # accepts_nested_attributes_for :lessons
    has_many :users, through: :lessons
    has_many :answers, through: :lessons

    validates :title, presence: true
    validates :description, presence: true,
                length: {minimum: 5, maximum: 100}
end
