class Lesson < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :answers, dependent: :destroy
	has_many :words, through: :answers
	has_many :choices, through: :answers

	accepts_nested_attributes_for :answers

end
