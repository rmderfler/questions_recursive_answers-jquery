class Answer < ActiveRecord::Base
  validates :an_answer, presence: true
  belongs_to :user
  belongs_to :answerable, :polymorphic => true
  has_many :answers, :as => :answerable, dependent: :destroy
end
