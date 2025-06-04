class Subject < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :grammar_rules, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
