class Flashcard < ApplicationRecord
  belongs_to :user

  validates :question, presence: true
  validades :answer, presence: true
end
