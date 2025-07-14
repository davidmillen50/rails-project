require "test_helper"

class LessonGrammarRuleTest < ActiveSupport::TestCase
  def setup
    @subject = Subject.create!(title: "Grammar", description: "Grammar lessons")
    @lesson = Lesson.create!(title: "Sample Lesson", body: "This is a sample lesson body.", subject: @subject)
    @grammar_rule = GrammarRule.create!(title: "Past Simple", subject: @subject,)
    @lesson_grammar_rule = LessonGrammarRule.new(lesson: @lesson, grammar_rule: @grammar_rule)
  end

  test "should be valid with valid attributes" do
    assert @lesson_grammar_rule.valid?
  end

  test "should require a lesson" do
    @lesson_grammar_rule.lesson = nil
    assert_not @lesson_grammar_rule.valid?
    assert_includes @lesson_grammar_rule.errors[:lesson], "must exist"
  end

  test "should require a grammar_rule" do
    @lesson_grammar_rule.grammar_rule = nil
    assert_not @lesson_grammar_rule.valid?
    assert_includes @lesson_grammar_rule.errors[:grammar_rule], "must exist"
  end

  test "should belong to lesson" do
    assert_equal @lesson, @lesson_grammar_rule.lesson
  end

  test "should belong to grammar_rule" do
    assert_equal @grammar_rule, @lesson_grammar_rule.grammar_rule
  end
end
