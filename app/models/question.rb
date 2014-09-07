class Question < ActiveRecord::Base
  validates :a_question, presence: true
  belongs_to :user
  has_many :answers, as: :answerable, dependent: :destroy
end
