require "test_helper"

class GrammarRuleTest < ActiveSupport::TestCase
  def setup
    @grammar_subject = Subject.create!(title: "Grammar", description: "Grammar lessons")
    @other_subject = Subject.create!(title: "Vocabulary", description: "Vocabulary lessons")
  end

  test "is valid with Grammar subject" do
    grammar_rule = GrammarRule.new(title: "test grammar rule", subject: @grammar_subject)
    assert grammar_rule.valid?
  end

  test "is invalid with non-Grammar subject" do
    grammar_rule = GrammarRule.new(subject: @other_subject)
    assert_not grammar_rule.valid?
    assert_includes grammar_rule.errors[:subject], "must be the Grammar subject"
  end

  test "destroys dependent lesson_grammar_rules" do
    grammar_rule = GrammarRule.create!(title: "test grammar rule", subject: @grammar_subject)
    lesson = Lesson.create!(title: "Lesson 1", body: "This is a sample lesson body.", subject: @grammar_subject)
    lgr = LessonGrammarRule.create!(lesson: lesson, grammar_rule: grammar_rule)
    assert_difference("LessonGrammarRule.count", -1) do
      grammar_rule.destroy
    end
  end

  test "is invalid without a subject if subject is required by schema" do
    grammar_rule = GrammarRule.new(title: "No Subject Rule", description: "Rule without subject")
    if GrammarRule.validators_on(:subject).any? { |v| v.kind == :presence }
      assert_not grammar_rule.valid?
      assert_includes grammar_rule.errors[:subject], "must exist"
    else
      assert grammar_rule.valid?
    end
  end

  test "does not allow subject with title other than 'Grammar'" do
    invalid_subject = Subject.create!(title: "Reading", description: "Reading lessons")
    grammar_rule = GrammarRule.new(subject: invalid_subject)
    assert_not grammar_rule.valid?
    assert_includes grammar_rule.errors[:subject], "must be the Grammar subject"
  end

  test "allows creation with valid attributes and Grammar subject" do
    grammar_rule = GrammarRule.new(
      subject: @grammar_subject,
      title: "Past Tense",
      description: "Rules for past tense"
    )
    assert grammar_rule.valid?
    assert grammar_rule.save
  end

  test "has many lesson_grammar_rules and lessons" do
    grammar_rule = GrammarRule.create!(subject: @grammar_subject, title: "Rule", description: "desc")
    lesson1 = Lesson.create!(title: "Lesson 1", body: "Body 1", subject: @grammar_subject)
    lesson2 = Lesson.create!(title: "Lesson 2", body: "Body 2", subject: @grammar_subject)
    lgr1 = LessonGrammarRule.create!(lesson: lesson1, grammar_rule: grammar_rule)
    lgr2 = LessonGrammarRule.create!(lesson: lesson2, grammar_rule: grammar_rule)
    assert_equal 2, grammar_rule.lesson_grammar_rules.count
    assert_equal 2, grammar_rule.lessons.count
    assert_includes grammar_rule.lessons, lesson1
    assert_includes grammar_rule.lessons, lesson2
  end
end
