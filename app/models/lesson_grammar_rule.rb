class LessonGrammarRule < ApplicationRecord
  belongs_to :lesson
  belongs_to :grammar_rule
end
