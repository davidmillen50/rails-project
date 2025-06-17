require "test_helper"

class LessonTest < ActiveSupport::TestCase
  test "is invalid without a title" do
    lesson = Lesson.new(body: "Sample body")
    assert_not lesson.valid?
    assert_includes lesson.errors[:title], "can't be blank"
  end

  test "is invalid without a body" do
    lesson = Lesson.new(title: "Sample title")
    assert_not lesson.valid?
    assert_includes lesson.errors[:body], "can't be blank"
  end

  test "is valid with both title and body" do
    lesson = Lesson.new(title: "Sample title", body: "Sample body", subject: Subject.first)
    assert lesson.valid?
  end
end