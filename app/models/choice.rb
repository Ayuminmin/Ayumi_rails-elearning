class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: :true,
              length: {minium: 2, maximum: 20}    
end
