require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grammar_subject = Subject.find_by(title: "Grammar")
    @lesson = Lesson.create!(title: "Sample Lesson One", body: "Lesson body One", subject: @grammar_subject)
    @grammar_rule = GrammarRule.create!(title: "Sample Grammar Rule", description: "Grammar rule description", subject: @grammar_subject)
    @lesson.grammar_rules << @grammar_rule
  end

  test "should get index" do
    get lessons_url, as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_kind_of Array, body
    assert_equal @lesson.title, body.first["title"]
  end

  test "should show lesson" do
    get lesson_url(@lesson), as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @lesson.title, body["title"]
    assert_equal @lesson.body, body["body"]
  end

  test "should create lesson" do
    assert_difference("Lesson.count") do
      post lessons_url, params: { lesson: { title: "New Lesson", body: "New body", subject_id: @grammar_subject.id } }, as: :json
    end
    assert_response :created
    body = JSON.parse(response.body)
    assert_equal "New Lesson", body["title"]
  end

  test "should not create lesson with invalid params" do
    assert_no_difference("Lesson.count") do
      post lessons_url, params: { lesson: { title: "" } }, as: :json
    end
    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert body.present?
  end
end
