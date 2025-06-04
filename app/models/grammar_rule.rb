class GrammarRule < ApplicationRecord
  belongs_to :subject
  has_many :lesson_grammar_rules, dependent: :destroy
  has_many :lessons, through: :lesson_grammar_rules

  validate :subject_must_be_grammar

  private

    def subject_must_be_grammar
      if subject && subject.title != "Grammar"
        errors.add(:subject, "must be the Grammar subject")
      end
    end
end
