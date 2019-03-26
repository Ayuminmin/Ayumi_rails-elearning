class Answer < ApplicationRecord
  belongs_to :word
  belongs_to :choice
  belongs_to :lesson
  has_many :categories, through: :lessons
  has_many :users, through: :lessons
end
