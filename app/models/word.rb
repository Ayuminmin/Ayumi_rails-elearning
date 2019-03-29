class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers

  has_many :choices, dependent: :destroy 
  
  accepts_nested_attributes_for :choices
  
  validates :content, presence: :true,
              length: {maximum: 50} 
  validate :check_choice

  private
    def check_choice
      correct_choices = choices.collect{ |c| c.correct || nil}
      if correct_choices.compact.size != 1
        errors.add(:correct, "no")
      end
    end
end
