class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers
  # accepts_nested_attributes_for :lessons, allow_destroy: true
  # has_many :words, through: :answers

  validates :content, presence: :true,
              length: {maximum: 20}    
end
