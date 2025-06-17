require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  def setup
    @subject = Subject.new(title: "English Basics", description: "Basic English grammar and vocabulary")
  end

  test "should be valid with valid attributes" do
    assert @subject.valid?
  end

  test "should be invalid without a title" do
    @subject.title = nil
    assert_not @subject.valid?
    assert_includes @subject.errors[:title], "can't be blank"
  end

  test "should be invalid without a description" do
    @subject.description = nil
    assert_not @subject.valid?
    assert_includes @subject.errors[:description], "can't be blank"
  end

  test "should destroy associated lessons when destroyed" do
    @subject.save!
    lesson = @subject.lessons.create!(title: "Lesson 1", body: "Content")
    assert_difference("Lesson.count", -1) do
      @subject.destroy
    end
  end

  test "should destroy associated grammar_rules when destroyed" do
    @grammar_subject = Subject.new(title: "Grammar", description: "Basic English grammar")
    @grammar_subject.save!
    rule = @grammar_subject.grammar_rules.create!(title: "Rule 1", description: "Rule content")
    assert_difference("GrammarRule.count", -1) do
      @grammar_subject.destroy
    end
  end
end
