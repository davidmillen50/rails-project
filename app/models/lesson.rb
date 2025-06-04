class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :lesson_grammar_rules
  has_many :grammar_rules, through: :lesson_grammar_rules

  validates :title, presence: true
  validates :body, presence: true
end
