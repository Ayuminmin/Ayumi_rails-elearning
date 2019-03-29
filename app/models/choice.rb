class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers
  has_many :categories, through: :word

  validates :content, presence: :true,
              length: {maximum: 50}    
end
